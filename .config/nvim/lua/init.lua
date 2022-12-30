
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
      disable_diagnostics = true,   -- Temporarily disable diagnostics for conflict buffers while in the view.
    },
    file_history = {
      -- Config for changed files in file history views.
      layout = "diff2_horizontal",
    },
  },
})

local neogit = require('neogit')
neogit.setup {
  disable_signs = false,
  disable_hint = false,
  disable_context_highlighting = false,
  disable_commit_confirmation = false,
  -- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
  -- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
  auto_refresh = true,
  disable_builtin_notifications = false,
  use_magit_keybindings = false,
  -- Change the default way of opening neogit
  kind = "tab",
  -- Change the default way of opening the commit popup
  commit_popup = {
    kind = "split",
  },
  -- Change the default way of opening popups
  popup = {
    kind = "split",
  },
  -- customize displayed signs
  signs = {
    -- { CLOSED, OPENED }
    section = { ">", "v" },
    item = { ">", "v" },
    hunk = { "", "" },
  },
  integrations = {
    diffview = true
  },
  -- Setting any section to `false` will make the section not render at all
  sections = {
    untracked = {
      folded = false
    },
    unstaged = {
      folded = false
    },
    staged = {
      folded = false
    },
    stashes = {
      folded = true
    },
    unpulled = {
      folded = true
    },
    unmerged = {
      folded = false
    },
    recent = {
      folded = true
    },
  },
  -- override/add mappings
  mappings = {
    -- modify status buffer mappings
    status = {
      -- Adds a mapping with "B" as key that does the "BranchPopup" command
      ["B"] = "BranchPopup",
      -- Removes the default mapping of "s"
      ["s"] = "",
    }
  }
}
