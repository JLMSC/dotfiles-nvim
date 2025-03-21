local M = {}

M.root_files = {
    ".clangd",
    ".clang-tidy",
    ".clang-format",
    "compile_commands.json",
    "compile_flags.txt",
    "configure.ac"
}

M.util = require("lspconfig.util")

function M.switch_source_header(bufnr)
    local method_name = "textDocument/switchSourceHeader"
    bufnr = M.util.validate_bufnr(bufnr)
    local client = M.util.get_activate_client_by_name(bufnr, "clangd")
    if not client then
	return vim.notify(("method %s is not supported by any servers active on the current buffer"):format(method_name))
    end
    local params = vim.lsp.util.make_text_document_params(bufnr)
    client.request(method_name, params, function(err, result)
	if err then
	    error(tostring(err))
	end
	if not result then
	    vim.notify("corresponding file cannot be determined")
	    return
	end
	vim.cmd.edit(vim.uri_to_fname(result))
    end, bufnr)
end

function M.source_info()
    local bufnr = vim.api.nvim_get_current_buf()
    local clangd_client = M.util.get_active_client_by_name(bufnr, "clangd")
    if not clangd_client or not clangd_client.supports_method("textDocument/symbolInfo") then
	return vim.notify("Clangd client not found", vim.log.levels.ERROR)
    end
    local win = vim.api.nvim_get_current_win()
    local params = vim.lsp.util.make_position_params(win, clangd_client.offset_encoding)
    clangd_client.request("textDocument/symbolInfo", params, function(err, res)
	if err or #res == 0 then
	    return
	end
	local container = string.format("container: %s", res[1].containerName)
	local name = string.format("name: %s", res[1].name)
	vim.lsp.util.open_floating_preview({ name, container }, "", {
	    height = 2,
	    width = math.max(string.len(name), string.len(container)),
	    focusable = false,
	    focus = false,
	    border = "single",
	    title = "Symbol Info"
	})
    end, bufnr)
end

function M.clangd_setup()
    require("lspconfig").clangd.setup({
	cmd = { "clangd" },
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	root_dir = function(fname)
	    return M.util.root_pattern(unpack(M.root_files))(fname)
		    or vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
	end,
	single_file_support = true,
	capabilities = {
	    textDocument = {
		completion = {
		    editsNearCursor = true
		}
	    },
	    offsetEncoding = { "utf-8", "utf-16" }
	},
	commands = {
	    ClangdSwitchSourceHeader = {
		function()
		    M.switch_source_header(0)
		end,
		description = "Switch between source/header"
	    },
	    ClangdShowSymbolInfo = {
		function()
		    M.symbol_info()
		end,
		description = "Show symbol info"
	    }
	}
    })
end

return M
