local _impatient, impatient = pcall(require, "impatient")
if _impatient then
    impatient.enable_profile()
end

require "options"
require "plugins"
require "lsp"
require "mappings"
require "autocmds"
require "commands"

-- alllow for opacity in wezterm
vim.cmd [[hi Normal guibg=none]]
-- sets character column
vim.cmd [[set colorcolumn=80]]
