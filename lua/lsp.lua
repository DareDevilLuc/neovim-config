require("mason").setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format" })

vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } }
    }
  }
})

local vue_typescript_plugin = vim.fn.expand(
"$MASON/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin")

vim.lsp.config("ts_ls", {
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_typescript_plugin,
        languages = { "vue" },
      },
    },
  },
})

vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--query-driver=C:/msys64/ucrt64/bin/*.exe",
  },
})

vim.lsp.enable({
  "lua_ls",
  "clangd",
  "ts_ls",
  "html",
  "cssls",
  "jsonls",
  "bashls",
  "vue_ls",
})
