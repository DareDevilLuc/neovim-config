vim.pack.add({
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/catppuccin/nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/saghen/blink.lib",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/akinsho/toggleterm.nvim",
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    version = vim.version.range('3')
  },
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/ellisonleao/gruvbox.nvim"
})

require("treesitter")
require("telescope")
require("lsp")
require("gruvbox").setup()

require("toggleterm").setup({
  size = 15,
  open_mapping = [[<c-\>]],
  direction = "horizontal",
  shade_terminals = true,
  start_in_insert = true,
  persist_mode = true,
})

require('nvim-ts-autotag').setup({
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = false
  }
})

local MiniDiff = require("mini.diff")
MiniDiff.setup({
  source = MiniDiff.gen_source.git({ index = false })
})

vim.keymap.set("n", "<leader>gg", "<cmd>tabnew | Git | only<cr>")
vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiffsplit<CR>")


local MiniSnippets = require("mini.snippets")
MiniSnippets.setup({
  snippets = {
    MiniSnippets.gen_loader.from_lang(),
  },
})
MiniSnippets.start_lsp_server({ match = false })

require("mini.comment").setup()

vim.keymap.set("x", "<C-_>", "gc", { remap = true })
vim.keymap.set("n", "<C-_>", "gcc", { remap = true })

local cmp = require('blink.cmp')
cmp.setup({
  keymap = {
    preset = "default",
    ["<CR>"] = { "fallback" },
    ["<Tab>"] = { "accept", "fallback" },
  },

  appearance = {
    nerd_font_variant = "mono",
  },

  sources = {
    default = {
      "lsp",
      "path",
      "snippets",
      "buffer",
    },
  },
  cmdline = {
    keymap = {
      preset = 'cmdline',
      ["<Tab>"] = { "show", "accept", "fallback"},
    },
    completion = {
      menu = { auto_show = true },
    },
  },
})

require("mini.pairs").setup()

require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      visible = true, -- show hidden/dotfiles too
      hide_dotfiles = false,
      hide_gitignored = false,
    },
    follow_current_file = {
      enabled = true, -- auto-highlight the file you're currently editing
    },
  },
  git_status = {
    symbols = {
      added     = "✚",
      modified  = "",
      deleted   = "✖",
      renamed   = "󰁕",
      untracked = "",
      ignored   = "",
      unstaged  = "󰄱",
      staged    = "",
      conflict  = "",
    },
  },
  default_component_configs = {
    git_status = {
      symbols = {
        added     = "✚",
        modified  = "",
        deleted   = "✖",
        renamed   = "󰁕",
        untracked = "",
        ignored   = "",
        unstaged  = "󰄱",
        staged    = "",
        conflict  = "",
      },
    },
  },
})
