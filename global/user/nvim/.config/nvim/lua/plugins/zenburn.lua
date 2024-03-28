return {
	"phha/zenburn.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("zenburn")
		vim.cmd("highlight Normal guibg=none")
		vim.cmd("highlight NonText guibg=none")
		vim.cmd("highlight Normal ctermbg=none")
		vim.cmd("highlight NonText ctermbg=none")
	end,
}
