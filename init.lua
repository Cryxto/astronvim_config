vim.g.clipboard = {
  name = "wslClipboard",
  copy = {
    ["+"] = "clip.exe",
    ["*"] = "clip.exe",
  },
  paste = {
    ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  },
  cache_enable = 0,
}
vim.api.nvim_exec([[
augroup auto_wrap
  autocmd!
  autocmd FileType * setlocal wrap
augroup END
]], true)
return {
  -- plugins = {
  --   {
  --     "L3MON4D3/LuaSnip",
  --     config = function(plugin, opts)
  --       require "plugins.configs.luasnip" (plugin, opts)                                       -- include the default astronvim config that calls the setup call
  --       require("luasnip.loaders.from_vscode").lazy_load { paths = { "./lua/user/snippets" } } -- load snippets paths
  --     end,
  --   },
  -- },
  icons = {
    VimIcon = "",
    ScrollText = "",
    -- GitBranch = "",
    -- GitAdd = "",
    -- GitChange = "",
    -- GitDelete = "",
    -- Git = "",
    -- GitAdd = "[+]"Git = "",
    GitAdd = "",
    --test
    GitBranch = "",
    GitChange = "",
    GitConflict = "",
    GitDelete = "",
    GitIgnored = "◌",
    GitRenamed = "➜",
    GitStaged = "✓",
    GitUnstaged = "✗",
    GitUntracked = "★",
    -- GitBranch = "",
    -- GitChange = "[/]",
    -- GitConflict = "[!]",
    -- GitDelete = "[-]",
    -- GitIgnored = "[I]",
    -- GitRenamed = "[R]",
    -- GitStaged = "[S]",
    -- GitUnstaged = "[U]",
    -- GitUntracked = "[?]",
  },
  heirline = {
    -- define the separators between each section
    -- add new colors that can be used by heirline
    separators = {
      left = { "", " " }, -- separator for the left side of the statusline
      right = { " ", "" }, -- separator for the right side of the statusline
      -- tab = { "", "" },
    },
    colors = function(hl)
      local get_hlgroup = require("astronvim.utils").get_hlgroup
      -- use helper function to get highlight group properties
      -- local comment_fg = get_hlgroup("Comment").fg
      -- hl.git_branch_fg = comment_fg
      -- hl.git_added = comment_fg
      -- hl.git_changed = comment_fg
      -- hl.git_removed = comment_fg
      hl.blank_bg = get_hlgroup("Folded").fg
      hl.file_info_bg = get_hlgroup("Visual").bg
      hl.nav_icon_bg = get_hlgroup("String").fg
      hl.nav_fg = hl.nav_icon_bg
      hl.folder_icon_bg = get_hlgroup("Error").fg
      return hl
    end,
    attributes = {
      mode = { bold = true },
    },
    -- icon_highlights = {
    --   file_icon = {
    --     statusline = true,
    --   },
    -- },
  },
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "stable",    -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly",    -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false,     -- automatically quit the current session after a successful update
    remotes = {            -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  -- colorscheme = "astrodark",
  colorscheme = "catppuccin",
  -- colorscheme = "tokyonight-moon",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = false,    -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    config = {
      -- tailwindcss = {
      --   filetypes = { 'jsx','tsx','js','ts','html','css' },
      -- },
      -- intelephense = {
      --   cmd = { "intelephense", "--stdio" },
      --   filetypes = { 'php', 'html.blade.php', 'blade' },
      -- },
      -- html = {
      --   -- cmd = { "vscode-html-language-server", "--stdio" },
      --   filetypes = {'html.ejs', 'html', 'html.blade.php', 'blade' },
      -- },
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- vim.treesitter.language.register('html', 'blade')
    vim.api.nvim_exec([[
  augroup blade_php
    autocmd!
    autocmd BufNewFile,BufRead *.blade.php set filetype=html.blade.php
    autocmd FileType html.blade.php set syntax=php
    autocmd FileType html.blade.php set syntax=html
    autocmd FileType html.blade.php set syntax=blade
  augroup END
]], true)
    vim.api.nvim_exec([[
  augroup ejs
    autocmd!
    autocmd BufNewFile,BufRead *.ejs set filetype=html
  augroup END
]], true)
    --    vim.api.nvim_exec([[
    --      let g:mkdp_open_to_the_world = 1
    -- function OpenMarkdownPreview (url)
    --    execute "silent ! chrome --new-window " . a:url
    --  endfunction
    --  let g:mkdp_browserfunc = 'OpenMarkdownPreview'
    --    ]], true)
    -- vim.api.nvim_exec([[
    --  call mkdp#util#install()
    -- ]],true)
    vim.filetype.add {
      extension =
      { blade = 'html' }
    }
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}
