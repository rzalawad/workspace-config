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
    {
        'dhruvasagar/vim-table-mode',
        init = function()
            vim.g.table_mode_map_prefix = '\\t'
            vim.g.table_mode_realign_map = '\\tr'
            vim.g.table_mode_delete_row_map = '\\tdd'
            vim.g.table_mode_delete_column_map = '\\tdc'
            vim.g.table_mode_insert_column_before_map = '\\tiC'
            vim.g.table_mode_insert_column_after_map = '\\tic'
            vim.g.table_mode_add_formula_map = '\\tfa'
            vim.g.table_mode_eval_formula_map = '\\tfe'
            vim.g.table_mode_echo_cell_map = '\\t?'
            vim.g.table_mode_sort_map = '\\ts'
            vim.g.table_mode_tableize_map = '\\tt'
            vim.g.table_mode_tableize_d_map = '\\T'
        end
    },
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
    'hrsh7th/nvim-cmp',      -- Autocompletion plugin
    'hrsh7th/cmp-nvim-lsp',  -- LSP source for nvim-cmp
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
    'mfussenegger/nvim-dap',
    { "rcarriga/nvim-dap-ui",            dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
    'theHamsta/nvim-dap-virtual-text',
    'mfussenegger/nvim-dap-python',
    "nyoom-engineering/oxocarbon.nvim",
    {
        "amitds1997/remote-nvim.nvim",
        version = "*",                       -- Pin to GitHub releases
        dependencies = {
            "nvim-lua/plenary.nvim",         -- For standard functions
            "MunifTanjim/nui.nvim",          -- To build the plugin UI
            "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
        },
        config = true,
    },
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000, -- Ensure it loads first
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end
    },
    {
        'stevearc/dressing.nvim',
        opts = {},
    },
    { "nvim-tree/nvim-web-devicons" },
    {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
            default = {
                embed_image_as_base64 = false,
                prompt_for_file_name = false,
                drag_and_drop = {
                    insert_mode = true,
                },
            },
        },
        keys = {
            { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
        },
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
            file_types = { "markdown" },
        },
        ft = { "markdown" },
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('render-markdown').setup({
                enabled = true,
                position = 'inline',
                checkbox = {
                    unchecked = { icon = '✘ ' },
                    -- checked = { icon = '✔ ', scope_highlight = nil },
                    checked = {
                        -- icon = '󰱒 ',
                        icon = '✔ ',
                        highlight = 'RenderMarkdownChecked',
                        scope_highlight = nil,
                    },
                    custom = {
                        todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
                        important = { raw = '[~]', rendered = '󰓎 ', highlight = 'DiagnosticWarn' },
                    },
                },
            })
        end,
    },
    { "zbirenbaum/copilot.lua" },
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        opts = {
            open_mapping = [[<Space>t]],
            insert_mappings = false,
            direction = "float"
        }
    },
    {
        'pwntester/octo.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require "octo".setup()
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "echasnovski/mini.ai",
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
        config = function()
            require("mini.ai").setup()
            local utils = require('utils')
            utils.on_load("which-key.nvim", function()
                vim.schedule(function()
                    utils.ai_whichkey({})
                end)
            end)
        end,
    },

    -- markdown plugins
    {
        "bullets-vim/bullets.vim"
    },
    {
        "hedyhli/outline.nvim",
        config = function()
            -- Example mapping to toggle outline
            vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
                { desc = "Toggle Outline" })

            require("outline").setup {
                -- Your setup opts here (leave empty to use defaults)
            }
        end,
    },
    {
        "hedyhli/markdown-toc.nvim",
        ft = "markdown", -- Lazy load on markdown filetype
        cmd = { "Mtoc" }, -- Or, lazy load on "Mtoc" command
        config = function()
            require('mtoc').setup({})
        end
    },
}

require("lazy").setup(plugins)
