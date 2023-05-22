if true then
  return {}
end
return {
  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },
  --
  { "neanias/everforest-nvim" },

  -- Configure LazyVim to load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },
}
