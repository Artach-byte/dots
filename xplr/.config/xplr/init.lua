version = "0.19.0"
-- Config
---- General
------ Show hidden
xplr.config.general.show_hidden = true




---- Plugins
local home = os.getenv("HOME")
package.path = home
.. "/.config/xplr/plugins/?/init.lua;"
.. home
.. "/.config/xplr/plugins/?.lua;"
.. package.path

----- Icons

require"icons".setup()

----- Trash-Cli

require("trash-cli").setup{
  trash_mode = "delete",
  trash_key = "d",
  restore_mode = "delete",
  restore_key = "r",
  trash_list_selector = "fzf -m | cut -d' ' -f3-"
}

----- Ouch
require("ouch").setup{
  mode = "action",
  key = "o",
}
