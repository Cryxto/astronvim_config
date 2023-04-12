return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity
  -- { import = "astrocommunity.editing-support.nvim-ts-rainbow", enabled = true },
  { import = "astrocommunity.colorscheme.catppuccin", enabled = true },
  { import = "astrocommunity.colorscheme.tokyonight", enabled = false },
  -- { import = "astrocommunity.markdown-and-latex.glow-nvim", enabled = true },
  -- {
  --   "glow.nvim",
  --   opts = {
  --     config = true, cmd = "Glow", pager = false
  --   }
  -- },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
}
