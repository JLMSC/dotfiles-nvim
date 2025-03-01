-- https://github.com/nvim-treesitter/nvim-treesitter
return {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "css",
                "csv",
                "json",
                "lua",
                "python",
            },
            highlight = {
                enable = true
            },
            indent = {
                enable = true
            }
        })
    end
}