
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

plugins = {
    'lukas-reineke/indent-blankline.nvim',
    'jaredgorski/spacecamp',
    'itchyny/lightline.vim',
    'chriskempson/base16-vim',
    'jacoborus/tender.vim',
    'lervag/vimtex',
    'tomasiser/vim-code-dark',
    'Mofiqul/vscode.nvim',
    'nvim-lua/plenary.nvim',
    'mhartington/oceanic-next',
    'sainnhe/edge',
    'morhetz/gruvbox',
    'sainnhe/sonokai',
    'tjdevries/colorbuddy.vim',
    'sainnhe/edge',
    'vigoux/oak',
    'dhruvasagar/vim-table-mode',
    'chrisbra/csv.vim',
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    -- 'tpope/vim-fugitive',
    'tpope/vim-surround',
    'tpope/vim-commentary',
    'nvim-telescope/telescope.nvim',
    'mbbill/undotree',
    'tpope/vim-unimpaired',
    'ThePrimeagen/refactoring.nvim',
    'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    },
    'onsails/lspkind-nvim',
    'p00f/clangd_extensions.nvim',
    'jpalardy/vim-slime',
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    -- Language server registry
    'lspcontainers/lspcontainers.nvim',
    -- Rust Tools
    'simrat39/rust-tools.nvim',
    'tweekmonster/startuptime.vim',
    'nvim-neorg/neorg',
    'TimUntersberger/neogit',
    'sindrets/diffview.nvim',
    'hkupty/iron.nvim',
    {
        'GCBallesteros/vim-textobj-hydrogen',
        dependencies = {
            "kana/vim-textobj-user",
            "kana/vim-textobj-line",
        }
    },
    'GCBallesteros/jupytext.vim',
    'MunifTanjim/nui.nvim',
    'jackMort/ChatGPT.nvim',
    'mfussenegger/nvim-dap',
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    'theHamsta/nvim-dap-virtual-text',
    'mfussenegger/nvim-dap-python',
    "nyoom-engineering/oxocarbon.nvim",
    {
       "amitds1997/remote-nvim.nvim",
       version = "*", -- Pin to GitHub releases
       dependencies = {
           "nvim-lua/plenary.nvim", -- For standard functions
           "MunifTanjim/nui.nvim", -- To build the plugin UI
           "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
       },
       config = true,
    },
    {
      "olimorris/onedarkpro.nvim",
      priority = 1000, -- Ensure it loads first
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
          { "zbirenbaum/copilot.lua" },
          { "nvim-lua/plenary.nvim" },
        },
        build = "make tiktoken",
        opts = {},
     },
}

require("lazy").setup(plugins)
