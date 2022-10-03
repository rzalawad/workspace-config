
require'lsp'
require'snips'
require'general'


-- neorg setup must be called after treesitter config
require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {},
        ["core.norg.completion"] = {
            config = {
                engine="nvim-cmp"
            }
        },
        ["core.integrations.nvim-cmp"] = {}
    }
}

local neogit = require('neogit')
neogit.setup()
