local M = {}

M.root_files = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
    ".git"
}

M.util = require("lspconfig.util")

function M.lua_ls_setup()
    require("lspconfig").lua_ls.setup({
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_dir = M.util.root_pattern(M.root_files),
        single_file_support = true,
        log_level = vim.lsp.protocol.MessageType.Warning
    })
end

return M