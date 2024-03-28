return {
	{
		"mrcjkb/rustaceanvim",
		version = "^4",
		ft = { "rust" },
	},
	{
		"Saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
		tag = "stable",
		config = function()
			require("crates").setup()
		end,
	},
}
