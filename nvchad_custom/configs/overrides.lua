local M = {}

M.treesitter = {
  ensure_installed = {
    "html",
    "css",
    "javascript",
    "rust",
    "python",
    "typescript",
    "markdown",
    "tsx",
    "c",
    "markdown_inline",
    "lua"
  },
  indent = {
    enable = true,
  }
}

M.nvimtree = {
  git = {
    enable = true,
  },

  render = {
    highlight_git = true,
    icons = {
      show = {
        git = true
      },
    },
  },
}

return M
