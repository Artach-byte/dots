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

----- dua-cli

require("dua-cli").setup{
  mode = "action",
  key = "D",
}

xplr.config.modes.builtin.default.key_bindings.on_key.P = {
  help = "preview",
  messages = {
    {
      BashExecSilently = [===[
        FIFO_PATH="/tmp/xplr.fifo"

        if [ -e "$FIFO_PATH" ]; then
          echo StopFifo >> "$XPLR_PIPE_MSG_IN"
          rm "$FIFO_PATH"
        else
          mkfifo "$FIFO_PATH"
          "$HOME/.local/bin/imv-open.sh" "$FIFO_PATH" "$XPLR_FOCUS_PATH" &
          echo "StartFifo: '$FIFO_PATH'" >> "$XPLR_PIPE_MSG_IN"
        fi
      ]===],
    },
  },
}

local function stat(node)
  return node.mime_essence
end

local function read(path, lines)
  local out = ""
  local p = io.open(path)

  if p == nil then
    return stat(path)
  end

  local i = 0
  for line in p:lines() do
    out = out .. line .. "\n"
    if i == lines then
      break
    end
    i = i + 1
  end
  p:close()

  return out
end

