return {
	"stevearc/overseer.nvim",
	config = function()
		local overseer = require("overseer")
		overseer.setup()

		local function nmap(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { silent = true, noremap = true, desc = desc })
		end

		nmap("<leader>or", "<cmd>OverseerRun<cr>", "Overseer: run task")
		nmap("<leader>ot", "<cmd>OverseerToggle<cr>", "Overseer: toggle list")
		nmap("<leader>oa", "<cmd>OverseerTaskAction<cr>", "Overseer: task action")
		nmap("<leader>os", "<cmd>OverseerShell<cr>", "Overseer: shell command")

		local function run_task(name)
			return function()
				overseer.run_task({ name = name, first = true }, function(_, err)
					if err then
						vim.notify(err, vim.log.levels.ERROR)
					end
				end)
			end
		end
		nmap("<D-b>", run_task("build"), "Overseer: build")
		nmap("<D-r>", run_task("run"), "Overseer: run")
	end,
}
