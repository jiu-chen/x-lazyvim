return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      --[[ things you want to change go here]]
      --  direction = 'vertical' | 'horizontal' | 'tab' | 'float',
      direction = "horizontal",
    },
    keys = { { "<leader>t", "<cmd>ToggleTerm<cr>", desc = "ToggleTerm" } },
  },
}
