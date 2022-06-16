local wezterm = require 'wezterm';

local dracula = require 'dracula';

return {
  font = wezterm.font("Caskaydia Cove Nerd Font", {font_size = 14.0 }),
  -- color_scheme = "nord",
  term = "wezterm",
  enable_wayland = true,
  colors = dracula,
  window_background_opacity = 0.9,
  window_decorations = "NONE",
  default_cursor_style = "SteadyBlock",
  hide_tab_bar_if_only_one_tab = true,
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = true,
  harfbuzz_features = {"zero"},
  scrollback_lines = 3500,
  keys = {
    {key="UpArrow", mods="SHIFT", action=wezterm.action{ScrollByLine=-1}},
    {key="DownArrow", mods="SHIFT", action=wezterm.action{ScrollByLine=1}},
  },
  check_for_updates = true,
  check_for_updates_interval_seconds = 86400,
  hyperlink_rules = {
    -- Linkify things that look like URLs
    -- This is actually the default if you don't specify any hyperlink_rules
    {
      regex = "\\b\\w+://(?:[\\w.-]+)\\.[a-z]{2,15}\\S*\\b",
      format = "$0",
    },

    -- linkify email addresses
    {
      regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
      format = "mailto:$0",
    },

    -- file:// URI
    {
      regex = "\\bfile://\\S*\\b",
      format = "$0",
    },

    -- Make task numbers clickable
    --[[
    {
      regex = "\\b[tT](\\d+)\\b"
      format = "https://example.com/tasks/?t=$1"
    }
    ]]
  }
  }
