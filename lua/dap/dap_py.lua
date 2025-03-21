local M = {}

M.dap = require("dap")

M.dap.adapters.python = function(cb, config)
    if config.request == "attach" then
	local port = (config.connect or config).port
	local host = (config.connect or config).host or "127.0.0.1"
	cb({
	    type = "server",
	    port = assert(port, "`connect.port` is required for a python `attach` configuration"),
	    host = host,
	    options = {
		source_filetype = "python",
	    },
	})
    else
	cb({
	    type = "executable",
	    -- NOTE: This should point to the .venv inside ~/.config/nvim
	    -- NOTE: Make sure debugpy is installed with pip
	    --command = "~/.config/nvim/.venv/debugpy/bin/python",
	    command = vim.fn.expand("~/.config/nvim/.venv/debugpy/bin/python"),
	    args = { "-m", "debugpy.adapter" },
	    options = {
		source_filetype = "python",
	    },
	})
    end
end

M.dap.configurations.python = {
    {
	type = "python";
	request = "launch";
	name = "launch file";
	program = "${file}";
	pythonPath = function()
	    -- NOTE: Here I'm assuming YOUR virtual enviroment will be ALWAYS .venv
	    -- If you want it to search for a different venv folder's name, just add them bellow.
	    local cwd = vim.fn.getcwd()
	    if vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
		return cwd .. "/.venv/bin/python"
	    else
		return "/usr/bin/python"
	    end
	end
    }
}

return M
