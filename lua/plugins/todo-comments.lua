-- https://github.com/folke/todo-comments.nvim
return {
    -- FIX: This is a test.
    -- TODO: This is a test.
    -- HACK: This is a test.
    -- WARN: This is a test.
    -- PERF: This is a test.
    -- NOTE: This is a test.
    -- TEST: This is a test.
    "folke/todo-comments.nvim",
    config = function()
	require("todo-comments").setup({
	    signs = true,
	    sign_priority = 8,
	    keywords = {
		-- https://fontawesome.com/
		-- https://catppuccin.com/palette/
		FIX = {
		    icon = "",
		    color = "#f38ba8",
		    alt = { "fix" }
		},
		TODO = {
		    icon = "",
		    color = "#a6e3a1",
		    alt = { "todo" }
		},
		HACK = {
		    icon = "",
		    color = "#fab387",
		    alt = { "hack" }
		},
		WARN = {
		    icon = "",
		    color = "#f9e2af",
		    alt = { "warn" }
		},
		PERF = {
		    icon = "",
		    color = "#eba0ac",
		    alt = { "perf" }
		},
		NOTE = {
		    icon = "",
		    color = "#89dceb",
		    alt = { "note" }
		},
		TEST = {
		    icon = "",
		    color = "#b4befe",
		    alt = { "test" }
		}
	    },
	    gui_style = {
		fg = "BOLD",
		bg = "NONE"
	    },
	    merge_keywords = true,
	    highlight = {
		multiline = false,
		before = "fg",
		keyword = "fg",
		after = "fg",
		max_line_len = 999
	    }
	})
    end
}
