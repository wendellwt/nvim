-- Fuzzy finder
local builtin = require('telescope.builtin')
return {
  -- https://github.com/nvim-telescope/telescope.nvim
  'nvim-telescope/telescope.nvim',
  lazy = true,
  branch = '0.1.x',
  dependencies = {
    -- https://github.com/nvim-lua/plenary.nvim
    { 'nvim-lua/plenary.nvim' },
    {
      -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  options  = {
    previewer = true, -- wt
    grep_previewer = true, -- wt
  },
  -- ???????????????
  keys = {
    -- the one I was trying to get working all along:
    { "<leader>tg", builtin.grep_string, desc = "grep_string" },
    { "<leader>tf",
        function() require("telescope.builtin").find_files() end,
        -- function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find File",
    },
    { "<leader>tb", ":Telescope buffers<cr>" },
    { "<leader>tx", builtin.buffers, {} }

  },
  -- ???????????????
  opts = {
    previewer = true, -- wt (unknown if this works)
    defaults = {
      previewer = true, -- wt (unknown if this works)
      layout_config = {
        vertical = {
          width = 0.75
        }
      }
    }
  }
}
