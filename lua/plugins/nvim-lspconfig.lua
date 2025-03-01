-- https://github.com/neovim/nvim-lspconfig
return {
    "neovim/nvim-lspconfig",
    config = function ()
        require("lsp.pyright").pyright_setup()
        require("lsp.lua_ls").lua_ls_setup()
	require("lsp.clangd").clangd_setup()
    end
}
