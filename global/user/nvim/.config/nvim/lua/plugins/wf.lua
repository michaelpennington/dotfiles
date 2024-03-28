return {
	"Cassin01/wf.nvim",
	version = "*",
	config = function()
		require("wf").setup()

		local which_key = require("wf.builtin.which_key")
		local register = require("wf.builtin.register")
		local buffer = require("wf.builtin.buffer")
		local mark = require("wf.builtin.mark")

		vim.keymap.set(
			"n",
			"<Space>wr",
			register(),
			{ noremap = true, silent = true, desc = "[wf.nvim] register" }
		)

		-- Buffer
		vim.keymap.set(
			"n",
			"<Space>wbu",
			-- buffer(opts?: table) -> function
			-- opts?: option
			buffer(),
			{ noremap = true, silent = true, desc = "[wf.nvim] buffer" }
		)

		-- Mark
		vim.keymap.set(
			"n",
			"'",
			mark(),
			{ nowait = true, noremap = true, silent = true, desc = "[wf.nvim] mark" }
		)

		-- Which Key
		vim.keymap.set(
			"n",
			"<Leader>",
			which_key({ text_insert_in_advance = "<Leader>" }),
			{ noremap = true, silent = true, desc = "[wf.nvim] which-key /" }
		)
		vim.keymap.set(
			"n",
			"<C-b>",
			which_key(),
			{ noremap = true, silent = true, desc = "[wf.nvim] which-key" }
		)
	end,
}
