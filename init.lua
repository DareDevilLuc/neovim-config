vim.g.mapleader = " "
require("vim._core.ui2").enable({})
require("commands")
require("pack")

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Reverse j and k in Normal, Visual, and Operator-pending modes
vim.keymap.set({ "n", "v", "o" }, "j", "k")
vim.keymap.set({ "n", "v", "o" }, "k", "j")
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>k')  -- j moves up for you
vim.keymap.set('n', '<C-k>', '<C-w>j')  -- k moves down for you
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set("n", "<A-h>", "<cmd>vertical resize -2<CR>")
vim.keymap.set("n", "<A-l>", "<cmd>vertical resize +2<CR>")
vim.keymap.set("n", "<A-j>", "<cmd>resize -2<CR>")
vim.keymap.set("n", "<A-k>", "<cmd>resize +2<CR>")

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "y", '"+y')
vim.keymap.set("n", "Y", '"+Y')
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.hl.on_yank()
  end
})

-- Indentation
vim.opt.tabstop = 2        -- how many spaces a literal <Tab> character displays as
vim.opt.softtabstop = 2    -- how many spaces pressing <Tab> inserts
vim.opt.shiftwidth = 2     -- how many spaces to use for each indent level (>>, <<, autoindent)
vim.opt.expandtab = true   -- convert tabs to spaces
vim.opt.smartindent = true -- smarter auto-indenting for code
vim.opt.autoindent = true


vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
})

vim.cmd.colorscheme("gruvbox")
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.opt.scrolloff = 10
vim.opt.cursorline = true

-- Auto Complete
vim.opt.completeopt = "menuone,noselect,fuzzy,nosort"
vim.opt.shortmess:append("c")

vim.opt.wildmode = "longest:full,full"
vim.opt.wildmenu = true
vim.opt.wildoptions = "pum"

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle file explorer" })

-- Quick save
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")
vim.keymap.set("i", "<C-s>", "<Esc><cmd>w<CR>a")

-- Better indentation
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Rename
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
