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
  },
  -- {
  --   "Pocco81/auto-save.nvim",
  --   lazy = false,
  -- }
  -- {
  --   "okuuva/auto-save.nvim",
  --   cmd = "ASToggle",                        -- optional for lazy loading on command
  --   event = { "InsertLeave", "TextChanged" } ,-- optional for lazy loading on trigger events
  --   opts = {
  --     -- your config goes here
  --     -- or just leave it empty :)
  --     trigger_events = {
  --       immediate_save = { "BufLeave", "FocusLost", "TextChangedI" }, -- vim events that trigger an immediate save
  --       defer_save = { "InsertLeave", "TextChanged" ,"CursorMoved", "CursorMovedI", "InsertChange", "TextChangedI", "InsertCharPre" }, -- vim events that trigger a deferred save (saves after `debounce_delay`)
  --       -- cancel_defered_save = { "InsertEnter" },   -- vim events that cancel a pending deferred save
  --     },
  --   },
  -- },
}
