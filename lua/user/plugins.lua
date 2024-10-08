-- Additional Plugins
lvim.plugins = {
  "olivercederborg/poimandres.nvim",
  -- Theme
  "sainnhe/gruvbox-material",
  "almo7aya/neogruvbox.nvim",
  "roobert/tailwindcss-colorizer-cmp.nvim",
  "lunarvim/github.nvim",
  "nvim-treesitter/playground",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "opalmay/vim-smoothie",
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
  },
  "christianchiarulli/nvim-ts-autotag",
  "kylechui/nvim-surround",
  "ThePrimeagen/harpoon",
  "MattesGroeger/vim-bookmarks",
  "NvChad/nvim-colorizer.lua",
  "ghillb/cybu.nvim",
  "moll/vim-bbye",
  "folke/todo-comments.nvim",
  "windwp/nvim-spectre",
  {
    "f-person/git-blame.nvim",
    opts = {
      -- your configuration comes here
      -- for example
      enabled = true, -- if you want to enable the plugin
      message_template = " <author> • <date> • <summary> ", -- template for the blame message, check the Message template section for more options
      date_format = "%d.%m.%Y %H:%M:%S", -- template for the date, check Date format section for more options
    },
  },
  "ruifm/gitlinker.nvim",
  "mattn/vim-gist",
  "mattn/webapi-vim",
  "folke/zen-mode.nvim",
  "lvimuser/lsp-inlayhints.nvim",
  "lunarvim/darkplus.nvim",
  "lunarvim/templeos.nvim",
  { "kevinhwang91/nvim-bqf",             version = false },
  "is0n/jaq-nvim",
  -- "hrsh7th/cmp-emoji",
  "ggandor/leap.nvim",
  "nacro90/numb.nvim",
  "TimUntersberger/neogit",
  "sindrets/diffview.nvim",
  "simrat39/rust-tools.nvim",
  "olexsmir/gopher.nvim",
  "leoluz/nvim-dap-go",
  "mfussenegger/nvim-dap-python",
  "jose-elias-alvarez/typescript.nvim",
  "mxsdev/nvim-dap-vscode-js",
  "petertriho/nvim-scrollbar",
  {
    "renerocksai/telekasten.nvim",
    lazy = false,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "saecki/crates.nvim",
    version = "v0.3.0",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup {
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      }
    end,
  },
  "MunifTanjim/nui.nvim",
  "jackMort/ChatGPT.nvim",
  {
    "jinh0/eyeliner.nvim",
    config = function()
      require("eyeliner").setup {
        highlight_on_key = true,
      }
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  { "christianchiarulli/telescope-tabs", branch = "chris" },
  "monaqa/dial.nvim",
  {
    "0x100101/lab.nvim",
    build = "cd js && npm ci",
  },
  "MunifTanjim/nui.nvim",
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
  },
  "renerocksai/calendar-vim",
  "mzlogin/vim-markdown-toc",
  "nvim-telescope/telescope-media-files.nvim",
  "nvim-telescope/telescope-symbols.nvim",
  "artempyanykh/marksman",
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  {
    "nvim-orgmode/orgmode",
  },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },
  {
    "stevearc/aerial.nvim",
    config = function()
      require("aerial").setup()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "Exafunction/codeium.nvim",
    config = function()
      require("codeium").setup {
        enable_chat = true,
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
  },
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      -- "nvim-lua/plenary.nvim",
      -- "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-go",
    },
    config = function()
      -- get neotest namespace (api call creates or returns namespace)
      local neotest_ns = vim.api.nvim_create_namespace "neotest"
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)
      require("neotest").setup {
        -- your neotest config here
        adapters = {
          require "neotest-go",
        },
      }
    end,
  },
  "nanotee/sqls.nvim",
  "junegunn/fzf",
  {
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      vim.diagnostic.config({
        virtual_text = false,
      })
      require("lsp_lines").setup()
    end,
  },
  { "RRethy/vim-illuminate" },
  { "nvim-neotest/nvim-nio" },
  {
    'wthollingsworth/pomodoro.nvim',
    dependencies = 'MunifTanjim/nui.nvim'
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async'
  },
  -- { "mfussenegger/nvim-dap" },
}

require("peek").setup {}
require("marksman").setup {}
