local M = {}

M.root_files = {
    "pyproject.toml",
    "setup.py",
    "setyp.cfg",
    "requirements.txt",
    "Pipfile",
    "pyrightconfig.json",
    ".git"
}

M.util = require('lspconfig.util')

function M.organize_imports()
    local params = {
        command = "pyright.organizeimports",
        arguments = { vim.uri_from_bufnr(0) }
    }
    local clients = M.util.get_lsp_clients {
        bufnr = vim.api.nvim_get_current_buf(),
        name = "pyright"
    }
    for _, client in ipairs(clients) do
        client.request("workspace/executeCommand", params, nil, 0)
    end
end

function M.set_python_path(path)
    local clients = M.util.get_lsp_clients {
        bufnr = vim.api.nvim_get_current_buf(),
        name = "pyright"
    }
    for _, client in ipairs(clients) do
        if client.settings then
            client.settings.python = vim.tbl_deep_extend("force", client.settings.python, { pythonPath = path })
        else
            client.config.settings = vim.tbl_deep_extend("force", client.config.settings, { python = { pythonPath = path } })
        end
        client.notify("workspace/didChangeConfiguration", { settings = nil })
    end
end

function M.pyright_setup()
    require("lspconfig").pyright.setup({
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_dir = function(fname)
            return M.util.root_pattern(unpack(M.root_files))(fname)
        end,
        single_file_support = true,
        settings = {
            python = {
                analysis = {
                    autoSearchPaths = true,
                    autoImportCompletions = true,
                    diagnosticMode = "openFilesOnly",
                    useLibraryCodeForTypes = true,
                    typeCheckingMode = "basic"
                }
            }
        },
        commands = {
            PyrightOrganizeImports = {
                M.organize_imports,
                description = "Organize python imports."
            },
            PyrightSetPythonPath = {
                M.set_python_path,
                description = "Reconfigure pyright with the provided python path",
                nargs = 1,
                complete = "file"
            }
        }
    })
end

return M