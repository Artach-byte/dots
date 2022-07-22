local wezterm = require("wezterm")
local dracula = require("dracula")

local colors = {
	bg = "#2e3440",
	fg = "#ECEFF4",
	red = "#bf616a",
	orange = "#d08770",
	yellow = "#ebcb8b",
	blue = "#81A1C1",
	green = "#a3be8c",
	cyan = "#88c0d0",
	cyan0 = "#8FBCBB",
	magenta = "#b48ead",
	white = "#E5E9F0",

	bg0 = "#949fb5",
	bg1 = "#4C566A",
	bg2 = "#434C5E",
	bg3 = "#3B4252",
	bg4 = "#242932",
	bg5 = "#1e222a",
	bg6 = "#1c1f26",
}

function font_with_fallback(name, params)
	local names = { name, "JetBrainsMono Nerd Font" }
	return wezterm.font_with_fallback(names, params)
end

wezterm.on("toggle-ligature", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if not overrides.font then
		overrides.font = font_with_fallback("Fira Code", {})
		overrides.font_rules = {
			{
				italic = false,
				intensity = "Normal",
				font = font_with_fallback("Fira Code", {}),
			},
			{
				italic = false,
				intensity = "Bold",
				font = font_with_fallback("Fira Code", {}),
			},
			{
				italic = true,
				intensity = "Normal",
				font = font_with_fallback("Fira Code", {}),
			},
			{
				italic = true,
				intensity = "Bold",
				font = font_with_fallback("Fira Code", {}),
			},
		}
	else
		overrides.font = nil
		overrides.font_rules = nil
		overrides.font_antialias = nil
	end
	window:set_config_overrides(overrides)
end)

return {
	--[[  window_decorations           = "NONE", ]]
	enable_wayland = true,
	--color_scheme                 ="nord",
	--colors                       = dracula,
	hide_tab_bar_if_only_one_tab = true,
	tab_max_width = 16,
	enable_scroll_bar = false,
	initial_rows = 30,
	initial_cols = 100,
	window_background_opacity = 0.95,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	text_background_opacity = 1.0,

	exit_behavior = "Close",
	font_size = 11,
	font = font_with_fallback("JetBrainsMono Nerd Font", {}),
	font_rules = {
		{
			italic = false,
			intensity = "Normal",
			font = font_with_fallback("JetBrainsMono Nerd Font", {}),
		},
		{
			italic = false,
			intensity = "Bold",
			font = font_with_fallback("JetBrainsMono Nerd Font", {}),
		},
		{
			italic = true,
			intensity = "Normal",
			font = font_with_fallback("JetBrainsMono Nerd Font", {}),
		},
		{
			italic = true,
			intensity = "Bold",
			font = font_with_fallback("JetBrainsMono Nerd Font", {}),
		},
	},

	bold_brightens_ansi_colors = false,
	colors = {
		foreground = colors.fg,
		background = colors.bg,
		cursor_bg = colors.blue,
		cursor_border = colors.blue,
		cursor_fg = colors.bg,
		selection_bg = colors.yellow,
		selection_fg = colors.bg,
		split = colors.bg5,

		ansi = {
			colors.bg3,
			colors.red,
			colors.green,
			colors.yellow,
			colors.blue,
			colors.magenta,
			colors.cyan,
			colors.white,
		},
		brights = {
			colors.bg1,
			colors.red,
			colors.green,
			colors.yellow,
			colors.blue,
			colors.magenta,
			colors.cyan0,
			colors.fg,
		},
		tab_bar = {
			background = colors.bg3,
			active_tab = {
				bg_color = colors.cyan,
				fg_color = colors.bg,
				intensity = "Bold",
				italic = true,
			},
			inactive_tab = {
				bg_color = colors.bg3,
				fg_color = colors.bg0,
				intensity = "Bold",
			},
			new_tab = {
				bg_color = colors.bg3,
				fg_color = colors.bg3,
			},
		},
	},
}
