local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>"}
  },
}

M.general = {
  n = {
    [";"] = {":", "enter command mode", opts = { nowait = true } },
    ["C-h"] = {"<cmd> TmuxNavigateLeft<CR>", "window left"},
    ["C-l"] = {"<cmd> TmuxNavigateRight<CR>", "window right"},
    ["C-k"] = {"<cmd> TmuxNavigateUp<CR>", "window up"},
    ["C-j"] = {"<cmd> TmuxNavigateDown<CR>", "window down"},

  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }
}

return M
