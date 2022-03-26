local actions = require "telescope.actions"
require('telescope').setup {
  defaults = {
    prompt_prefix = "> ",
    mappings = {
      i = {
        ["kj"] = actions.close,
        ["jk"] = actions.close,
      },

      n = {
        ["kj"] = actions.close,
        ["jk"] = actions.close,
      }
    }
  }
}

require('telescope').load_extension('fzf')

