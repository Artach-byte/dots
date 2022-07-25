-- https://xplr.dev/en/configuration

---@diagnostic disable
version = "0.19.0"
local xplr = xplr
---@diagnostic enable

local home = os.getenv("HOME")

-- Lua search path
package.path = home .. "/.config/xplr/plugins/?/init.lua;" .. home .. "/.config/xplr/plugins/?.lua;" .. package.path

-- Plugin Manager
local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
local xpm_url = "https://github.com/dtomvan/xpm.xplr"

package.path = package.path .. ";" .. xpm_path .. "/?.lua;" .. xpm_path .. "/?/init.lua"

os.execute(string.format("[ -e '%s' ] || git clone '%s' '%s'", xpm_path, xpm_url, xpm_path))

xplr.config.general.show_hidden = true
-- Plugins
xplr.config.modes.builtin.default.key_bindings.on_key.x = {
	help = "xpm",
	messages = {
		"PopMode",
		{ SwitchModeCustom = "xpm" },
	},
}

require("xpm").setup({
	auto_install = true,
	auto_cleanup = true,
	plugins = {
		-- Let xpm manage itself
		"dtomvan/xpm.xplr",

		{
			name = "Junker/nuke.xplr",
			setup = function()
				require("nuke").setup({})

				local key = xplr.config.modes.builtin.default.key_bindings.on_key
				key.v = {
					help = "nuke",
					messages = { "PopMode", { SwitchModeCustom = "nuke" } },
				}
			end,
		},

		-- xplr icon theme
		"prncss-xyz/icons.xplr",

		-- A clean, distraction free xplr table UI
		"sayanarijit/zentable.xplr",

		-- trach-cli integration for xplr
		"sayanarijit/trash-cli.xplr",

		-- dragon integration for xplr
		"sayanarijit/dragon.xplr",

		-- wayland clip based copy-paste integration for xplr
		"sayanarijit/wl-clipboard.xplr",

		-- type-to-nav port for xplr
		"sayanarijit/type-to-nav.xplr",

		-- An interactive finder plugin to complement map.xplr
		"sayanarijit/find.xplr",

		-- dua-cli integration for xplr
		"sayanarijit/dua-cli.xplr",

		-- xplr wrapper for https://github.com/ouch-org/ouch
		"dtomvan/ouch.xplr",

		-- Adds (dev)icons to xplr.
		{
			"dtomvan/extra-icons.xplr",
			after = function()
				xplr.config.general.table.row.cols[1] = {
					format = "custom.icons_dtomvan_col_1",
				}
			end,
		},
		-- qrcp integration for xplr
		{
			name = "sayanarijit/qrcp.xplr",
			setup = function()
				require("qrcp").setup({
					send_options = "-i $(ip link show | awk '{print $2}' | grep ':$' | cut -d: -f1 | fzf)",
					receive_options = "-i $(ip link show | awk '{print $2}' | grep ':$' | cut -d: -f1 | fzf)",
				})
			end,
		},
	},
})

xplr.config.modes.builtin.default.key_bindings.on_key.P = {
	help = "preview",
	messages = {
		{
			BashExecSilently = [===[
        FIFO_PATH="/tmp/xplr.fifo"

        if [ -e "$FIFO_PATH" ]; then
          echo StopFifo >> "$XPLR_PIPE_MSG_IN"
          rm -f -- "$FIFO_PATH"
        else
          mkfifo "$FIFO_PATH"
          "$HOME/.local/bin/imv-open.sh" "$FIFO_PATH" "$XPLR_FOCUS_PATH" &
          echo "StartFifo: '$FIFO_PATH'" >> "$XPLR_PIPE_MSG_IN"
        fi
      ]===],
		},
	},
}
