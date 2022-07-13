local wezterm = require "wezterm";

-- color variant hex codes
local colors = {
	mocha = {
		rosewater = "#f5e0dc",
		flamingo = "#f2cdcd",
		pink = "#f5c2e7",
		mauve = "#cba6f7",
		red = "#f38ba8",
		maroon = "#eba0ac",
		peach = "#fab387",
		yellow = "#f9e2af",
		green = "#a6e3a1",
		teal = "#94e2d5",
		sky = "#89dceb",
		sapphire = "#74c7ec",
		blue = "#89b4fa",
		lavender = "#b4befe",
		text = "#cdd6f4",
		subtext1 = "#bac2de",
		subtext0 = "#a6adc8",
		overlay2 = "#9399b2",
		overlay1 = "#7f849c",
		overlay0 = "#6c7086",
		surface2 = "#585b70",
		surface1 = "#45475a",
		surface0 = "#313244",
		base = "#1e1e2e",
		mantle = "#181825",
		crust = "#11111b"
	}
}

local catppuccin = {}
function catppuccin.select(palette)
	-- shorthand to check for the Latte flavour
	local isMocha = palette == "mocha"

	return {
		foreground = colors[palette].text,
		background = colors[palette].base,
		cursor_bg = colors[palette].rosewater,
		cursor_border = colors[palette].rosewater,
		cursor_fg = isMocha and colors[palette].base or colors[palette].crust,
		selection_bg = colors[palette].surface2,
		selection_fg = colors[palette].text,
		ansi = {
			isMocha and colors[palette].subtext1 or colors[palette].surface1,
			colors[palette].red,
			colors[palette].green,
			colors[palette].yellow,
			colors[palette].blue,
			colors[palette].pink,
			colors[palette].teal,
			isMocha and colors[palette].surface2 or colors[palette].subtext1
		},
		brights = {
			isMocha and colors[palette].subtext0 or colors[palette].surface2,
			colors[palette].red,
			colors[palette].green,
			colors[palette].yellow,
			colors[palette].blue,
			colors[palette].pink,
			colors[palette].teal,
			isMocha and colors[palette].surface1 or colors[palette].subtext0,
		},
		tab_bar = {
			background = colors[palette].base,
			active_tab = {
				bg_color = colors[palette].surface2,
				fg_color = colors[palette].text
			},
			inactive_tab = {
				bg_color = colors[palette].base,
				fg_color = colors[palette].text
			},
			inactive_tab_hover = {
				bg_color = colors[palette].surface2,
				fg_color = colors[palette].text
			},
			new_tab = {
				bg_color = colors[palette].base,
				fg_color = colors[palette].text
			},
			new_tab_hover = {
				bg_color = colors[palette].surface2,
				fg_color = colors[palette].text,
				italic = true
			}
		},
		visual_bell = colors[palette].surface0,
		indexed = {
			[16] = colors[palette].peach,
			[17] = colors[palette].rosewater
		},
		scrollbar_thumb = colors[palette].surface2,
		split = colors[palette].overlay0,
		-- nightbuild only
		compose_cursor = colors[palette].flamingo
	}
end

-- utility functions for interacting with wezterm API
local function scheme_for_appearance(appearance, options)
	if appearance:find("Dark") then
		return catppuccin.select(options.sync_flavours.dark)
	else
		return catppuccin.select(options.sync_flavours.light)
	end
end

function catppuccin.setup(options)
	-- default to not syncing with the OS theme
	local should_sync = true
	if options.sync == false then should_sync = false end

	-- default options
	options = {
		sync = should_sync,
		sync_flavours = options.sync_flavours or {
			light = "latte",
			dark = "mocha"
		},
		flavour = options.flavour or "mocha"
	}

	-- if sync is enabled, hook into the window-config-reloaded event
	-- snippet from https://wezfurlong.org/wezterm/config/lua/window/get_appearance.html#windowget_appearance
	if options.sync then
		wezterm.on("window-config-reloaded", function(window, pane)
			local overrides = window:get_config_overrides() or {}
			local appearance = window:get_appearance()
			local scheme = scheme_for_appearance(appearance, options)
			if overrides.background ~= scheme.background then
				overrides.colors = scheme
				window:set_config_overrides(overrides)
			end
		end)
	end

	return catppuccin.select(options.flavour)
end

return catppuccin
