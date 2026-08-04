local treesitter = require("nvim-treesitter")

require("nvim-treesitter.install").compilers = { "clang" }

local ensure_installed = {
  "typescript", "javascript", "tsx", "html", "css", "json", "bash", "vue", "cpp", "lua", "python", "markdown", "markdown_inline", "yaml"
}

treesitter.install(ensure_installed)

