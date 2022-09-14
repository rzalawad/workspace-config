
require'lsp'
require'snips'

require('neorg').setup {
    load = {
        ["core.defaults"] = {}
    }
}

local neogit = require('neogit')
neogit.setup()
