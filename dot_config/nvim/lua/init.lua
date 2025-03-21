vim.g.mapleader = " "
require('plugins')
require('vimopts')
require('keymaps')

require('lsp')
require('snips')
require('general')
require('debugging')
require('github_copilot')

-- neorg setup must be called after treesitter config
require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.completion"] = {
            config = {
                engine = "nvim-cmp"
            }
        },
        ["core.integrations.nvim-cmp"] = {},
        ["core.export.markdown"] = {},
        ["core.export"] = {},
    }
}

require("diffview").setup({
    view = {
        -- Configure the layout and behavior of different types of views.
        -- Available layouts:
        --  'diff1_plain'
        --    |'diff2_horizontal'
        --    |'diff2_vertical'
        --    |'diff3_horizontal'
        --    |'diff3_vertical'
        --    |'diff3_mixed'
        --    |'diff4_mixed'
        -- For more info, see ':h diffview-config-view.x.layout'.
        default = {
            --   -- Config for changed files, and staged files in diff views.
            layout = "diff2_horizontal",
        },
        merge_tool = {
            -- Config for conflicted files in diff views during a merge or rebase.
            layout = "diff3_mixed",
            disable_diagnostics = true, -- Temporarily disable diagnostics for conflict buffers while in the view.
        },
        file_history = {
            -- Config for changed files in file history views.
            layout = "diff2_horizontal",
        },
    },
})

local neogit = require('neogit')
neogit.setup {}

local iron = require "iron.core"
iron.setup({
    config = {
        should_map_plug = false,
        scratch_repl = true,
        repl_definition = {
            python = {
                command = { "ipython" },
                format = require("iron.fts.common").bracketed_paste,
            },
        },
        repl_open_cmd = require('iron.view').split.vertical.botright('50%'),
    },
    keymaps = {
        send_motion = "<Leader>s",
        visual_send = "<Leader>s",
    },
})

git_dir = require('lspconfig').util.find_git_ancestor(vim.fn.getcwd())
if git_dir == nil then
    git_dir = vim.fn.getcwd()
end
dotfiles_dir = "~/.config/nvim/"

local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
            n = {
                ["<Space>bd"] = actions.delete_buffer,
                ["<Space>bq"] = actions.close,
            }
        }
    }
}

function custom_live_grep()
    local dir = vim.fn.input("Enter directory to grep: ", "", "file")
    require('telescope.builtin').live_grep({ cwd = dir })
end

function custom_find_file()
    local dir = vim.fn.input("Enter directory to search: ", "", "file")
    require('telescope.builtin').find_files({ cwd = dir })
end

-- Remap Alt + Arrow Keys for window navigation
vim.api.nvim_set_keymap('n', '<A-Left>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-Down>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-Up>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-Right>', '<C-w>l', { noremap = true, silent = true })
