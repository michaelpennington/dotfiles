return {
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			vim.g.lazygit_floating_window_use_plenary = 1
			vim.cmd([[
      if has('nvim') && executable('nvr')
        let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
      endif
    ]])
			vim.keymap.set("n", "<leader>l", ":LazyGit<CR>", { silent = true })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})
		end,
	},
}
