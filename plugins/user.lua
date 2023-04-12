return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  -- {
  --   "jwalton512/vim-blade"
  --   ,
  --   lazy = false
  -- }
  {
    "iamcco/markdown-preview.nvim",
    -- run = function()
    --   vim.fn["mkdp#util#install"]()
    -- end,
    lazy = false,
    -- Solve after MarkdownPreview do nothing :
    -- https://github.com/iamcco/markdown-preview.nvim/issues/509#issuecomment-1272483338
  },
  {
    "manzeloth/live-server",
    lazy = false
  }
}
