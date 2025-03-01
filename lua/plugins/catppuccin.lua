-- https://github.com/catppuccin/nvim
return {
    "catppuccin/nvim",
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            styles = {
                comments = { "italic" },
                conditionals = { "bold" },
                loops = { "bold" },
                functions = { "italic" },
                keywords = { "bold" },
                strings = {},
                variables = {},
                numbers = {},
                booleans = { "bold" },
                properties = { "italic" },
                types = { "italic" },
                operators = { "bold" }
            }
        })
        vim.cmd.colorscheme "catppuccin"
    end
}