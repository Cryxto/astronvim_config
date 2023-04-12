-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  i = {
    ["<c-c>"] = { '"+y', desc = "" },
    ["<c-v>"] = { "<c-r>+", desc = "" },
    ["<M-Down>"] = { "<cmd>m+<cr>", desc = "" },
    ["<M-Up>"] = { "<cmd>m-2<cr>", desc = "" },
    ["<S-Up>"] = { "<cmd>t.<cr>", desc = "" },
    ["<S-Down>"] = { "<cmd>t -1<cr>", desc = "" },
    -- ["<C-s>"] = { "<cmd>w<cr>", desc = "" },
    -- ["<C-l>"] = { "<cmd>LiveServer start<cr><cr>", desc = "" },
    -- ["<C-f>"] = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", desc = "Format File" },
  },
  v = {
    ["<A-j>"] = { ":m .+1<CR>==", desc = "move line up" },
    ["<A-k>"] = { ":m .-2<CR>==", desc = "move line down" },
    ["p"] = { '"_dP', desc = "" },
    ["<c-c>"] = { '"+y', desc = "" },
    ["<c-v>"] = { '"+p', desc = "" },
    ["J"] = { ":move '>+1<CR>gv-gv", desc = "" },
    ["K"] = { ":move '<-2<CR>gv-gv", desc = "" },
    -- ["<A-j>"] = { ":move '>+1<CR>gv-gv", desc = "" },
    ["<A-Down>"] = { ":move '>+1<CR>gv-gv", desc = "" },
    -- ["<A-k>"] = { ":move '<-2<CR>gv-gv", desc = "" },
    ["<A-Up>"] = { ":move '<-2<CR>gv-gv", desc = "" },
    ["<S-Down>"] = { ":'<,'>t'><cr>", desc = "" },
  },
  n = {
    ["<leader>st"] = { ':LiveServer start<cr>', desc = "live server start" },
    ["<leader>sp"] = { ':LiveServer stop<cr>', desc = "live server stop" },
    ["<leader>mp"] = { ':MarkdownPreview<cr>', desc = "markdown preview" },
    ["<leader>ms"] = { ':MarkdownPreviewStop<cr>', desc = "markdown preview stop" },
    ["<leader>cc"] = { '"+y', desc = "copy" },
    ["<leader>vv"] = { '"+p', desc = "paste" },
    ["<S-Down>"] = { "<cmd>t.<cr>", desc = "" },
    ["<S-Up>"] = { "<cmd>t -1<cr>", desc = "" },
    ["<M-J>"] = { "<cmd>t.<cr>", desc = "" },
    ["<M-K>"] = { "<cmd>t -1<cr>", desc = "" },
    ["<M-Down>"] = { "<cmd>m+<cr>", desc = "" },
    ["<M-Up>"] = { "<cmd>m-2<cr>", desc = "" },
    ["<M-j>"] = { "<cmd>m+<cr>", desc = "" },
    ["<M-k>"] = { "<cmd>m-2<cr>", desc = "" },
    -- ["<C-f>"] = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", desc = "Format File" },
    ["q"] = { "<cmd>q<cr>", desc = "" },
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
