return {
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd("highlight default link gitblame SpecialComment")
      vim.g.gitblame_enabled = 1
      vim.g.gitblame_message_template = "<author> • <date>"
    end,
  },
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
  },
}
