local wezterm = require 'wezterm';

return {
    allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace",
    enable_wayland = true,
    audible_bell = "Disabled",
    automatically_reload_config = true,
    bold_brightens_ansi_colors = false,
    canonicalize_pasted_newlines = "LineFeed",
    check_for_updates = false,
    color_scheme = "nord",
    default_cursor_style = "BlinkingBar",
    exit_behavior = "Close",
    font = wezterm.font({
    "FiraCode Nerd Font",
    harfbuzz_features={"calt=1", "clig=1", "liga=1"}
  }),
    font_antialias = "Subpixel",
    font_size = 11,
    hide_tab_bar_if_only_one_tab = true,
    -- desaturate inactive panes
    window_background_opacity = 0.95,
    window_decorations = "NONE",
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
    } }
