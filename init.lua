require 'core.options' -- Load general options
require 'core.keymaps' -- Load general keymaps
require 'core.snippets' -- Custom code snippets

-- Set up the Lazy plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set up plugins
-- mostly based on Hendrik's https://github.com/hendrikmi/neovim-kickstart-config
require('lazy').setup {

  -- I think I like this file manager better than Hendrik's neotree
  require 'plugins.oil',
  -- orig: require 'plugins.neotree',

  -- I like this color scheme the best: sorbet (maybe with some custom colors)
  -- theirs hid the indent bars
  require 'plugins.colortheme_sorbet',

  -- the top line showing tabs/buffers
  require 'plugins.bufferline',

  -- the bottom status line
  require 'plugins.lualine',

  -- a lsp module(?) that allows syntax highlighting
  require 'plugins.treesitter',

  -- TJ's module, very useful (but fzf-lua may be an interesting alternative)
  require 'plugins.telescope',

  -- general Language Server Protocol module
  require 'plugins.lsp',

  -- code completion, I like this one better:
  require 'plugins.nvim-cmp',
  -- hendrik: require 'plugins.autocompletion',


  -- surround selection with " or ' or () or ...
  require 'plugins.surround',
  -- https://github.com/kylechui/nvim-surround

  -- CAUSES REFORMATTING, so NEEDS EDITING to turn off reformatting:
  require 'plugins.none-ls',

  require 'plugins.gitsigns',   -- not sure
  require 'plugins.alpha',   -- not sure
  require 'plugins.indent-blankline',
  require 'plugins.misc',   -- not sure

  -- may be useful, but could not get it to do anything useful
  -- require 'plugins.comment',
}

-- open up Oil (could not get this to work inside oil.lua)
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
