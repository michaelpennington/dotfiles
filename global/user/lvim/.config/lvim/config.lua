--[[
lvim is the global options object

Linters should be --
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- gruvbox material
lvim.colorscheme = 'zenburn'

vim.api.nvim_set_keymap('n', 'H', ':bp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'L', ':bn<CR>', { noremap = true, silent = true })

vim.opt.mouse = ""

-- general

vim.cmd [[set nrformats+=alpha]]

lvim.log.level = "warn"
lvim.format_on_save = true
vim.opt.termguicolors = true
lvim.keys.insert_mode["<A-j>"] = false
lvim.keys.insert_mode["<A-k>"] = false
lvim.keys.normal_mode["<A-j>"] = false
lvim.keys.normal_mode["<A-k>"] = false
lvim.keys.visual_block_mode["<A-j>"] = false
lvim.keys.visual_block_mode["<A-k>"] = false
lvim.keys.visual_block_mode["J"] = false
lvim.keys.visual_block_mode["K"] = false
vim.opt.shell = "/bin/sh"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
vim.api.nvim_set_keymap('n', '<A-a>', '<C-a>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-x>', '<C-x>', { noremap = true })
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.builtin.lualine.options.theme = "zenburn"
lvim.builtin.lualine.sections.lualine_y = { 'location' }

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
-- lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.dap.active = true
-- lvim.builtin.nvimtree.show_icons.git = 0

lvim.transparent_window = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local caps = client.server_capabilities
--   if caps.semanticTokensProvider and caps.semanticTokensProvider.full then
--     local augroup = vim.api.nvim_create_augroup("SemanticTokens", {})
--     vim.api.nvim_create_autocmd("TextChanged", {
--       group = augroup,
--       buffer = bufnr,
--       callback = function()
--         vim.lsp.buf.semantic_tokens_full()
--       end,
--     })
--     -- fire it first time on load as well
--     vim.lsp.buf.semantic_tokens_full()
--   end

-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { "eddyekofo94/gruvbox-flat.nvim" },
  {
    "ray-x/lsp_signature.nvim",
    config = function() require "lsp_signature".on_attach() end,
    event = "BufRead"
  },
  { "martineausimon/vim-lilypond-suite" },
  { "ethanholz/nvim-lastplace" },
  { "igankevich/mesonic" },
  {
    "p00f/clangd_extensions.nvim",
    config = function()
      require("clangd_extensions").setup {}
    end
  },
  { "simrat39/rust-tools.nvim" },
  { "Shatur/neovim-session-manager" },
  { 'nvim-telescope/telescope-ui-select.nvim' },
  { 'nvim-telescope/telescope-fzy-native.nvim' },
  {
    'saecki/crates.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup()
    end,
  },
  -- { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } },
  { 'pest-parser/pest.vim' },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  },
  {
    "danymat/neogen",
    config = function()
      require('neogen').setup {}
    end,
    dependencies = "nvim-treesitter/nvim-treesitter"
  },
  { 'tikhomirov/vim-glsl' },
  { 'nanotee/zoxide.vim' },
  {
    "ellisonleao/glow.nvim",
    config = function()
      require('glow').setup {}
    end
  },
  {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {
        dimming = {
          alpha = 0.5
        }
      }
    end
  },
  {
    "ziontee113/color-picker.nvim",
    config = function()
      require("color-picker")
    end,
  },
  { 'stevearc/dressing.nvim' },
  {
    "ziontee113/icon-picker.nvim",
    config = function()
      require("icon-picker").setup({
        disable_legacy_commands = true
      })
    end,
  },
  {
    "nvim-neorg/neorg",
    version = "*",
    ft = "norg",
    after = "nvim-treesitter", -- You may want to specify Telescope here as well
    config = function()
      require('neorg').setup {
        load = {
          ["core.defaults"] = {},       -- Loads default behaviour
          ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = {           -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
        },
      }
    end,
    build = ":Neorg sync-parsers",
    dependencies = "nvim-lua/plenary.nvim",
  },
  { 'nvim-treesitter/playground' },
  {
    'phha/zenburn.nvim',
    config = function() require("zenburn").setup() end
  },
}


require('session_manager').setup({
  autosave_last_session = true,
  autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir,
})

local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode',
  name = 'lldb'
}
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/home/mpennington/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
  -- name = 'cppdbg',
}

-- dap.configurations.cpp = {
--   {
--     name = 'Launch',
--     type = 'lldb',
--     request = 'launch',
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = '${workspaceFolder}',
--     stopOnEntry = false,
--     args = {},
--     runInTerminal = true,
--     env = function()
--       local variables = {}
--       for k, v in pairs(vim.fn.environ()) do
--         table.insert(variables, string.format("%s=%s", k, v))
--       end
--       return variables
--     end,
--   }
-- }

dap.configurations.cpp = {
  {
    name = 'Attach to gdbserver :3333',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    -- debugServerPath = "/usr/bin/openocd",
    -- debugServerArgs =
    -- "-f interface/jlink.cfg -f board/sifive-hifive1-revb.cfg",
    miDebuggerServerAddress = 'localhost:3333',
    miDebuggerPath = '/usr/bin/riscv64-unknown-elf-gdb',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
    setupCommands = {
      {
        text = '-enable-pretty-printing',
        description = 'enable pretty printing',
        ignoreFailures = false
      },
    },
    env = function()
      local variables = {}
      for k, v in pairs(vim.fn.environ()) do
        table.insert(variables, string.format("%s=%s", k, v))
      end
      return variables
    end,
  }
}

vim.cmd([[
    nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
    nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
    nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
    nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
    nnoremap <silent> <Leader>db <Cmd>lua require'dap'.toggle_breakpoint()<CR>
]])

lvim.builtin.which_key.mappings["d"] = {
  name = "Debugging",
  b = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint" },
  B = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", "Breakpoint condition" },
  p = { "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", "Set logpoint" },
  r = { "<Cmd>lua require'dap'.repl.open()<CR>", "Open repl" },
  l = { "<Cmd>lua require'dap'.run_last()<CR>", "Run last" },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.asm = dap.configurations.cpp

dap.configurations.rust = dap.configurations.cpp

local dapui = require('dapui')

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
    settings = {
      ['rust-analyzer'] = {
        checkOnSave = {
          command = "clippy"
        }
      }
    }
  },
})

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>", opts)
vim.keymap.set("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
vim.keymap.set("i", "<C-e>", "<cmd>IconPickerInsert<cr>", opts)

require('lspconfig').taplo.setup {}
require('lspconfig').clangd.setup {
  settings = {
    clangd = {
      cmd = '/usr/lib/llvm/17/bin/clangd'
    }
  }
}


vim.cmd([[
augroup MyColors
autocmd!
autocmd ColorScheme * highlight @text.strong cterm=bold gui=bold
autocmd ColorScheme * highlight @text.emphasis cterm=italic gui=italic
augroup end
]])
