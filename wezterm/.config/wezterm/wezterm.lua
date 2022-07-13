local wezterm = require "wezterm"
local dracula = require 'dracula';

function font_with_fallback(name, params)
  local names = { name, "JetBrainsMono Nerd Font" }
  return wezterm.font_with_fallback(names, params)
end

wezterm.on(
  "toggle-ligature",
  function(window, pane)
    local overrides = window:get_config_overrides() or {}
    if not overrides.font then
      overrides.font = font_with_fallback("Fira Code", {})
      overrides.font_rules = {
        {
          italic = false,
          intensity = "Normal",
          font = font_with_fallback("Fira Code", {})
        },
        {
          italic = false,
          intensity = "Bold",
          font = font_with_fallback("Fira Code", {})
        },
        {
          italic = true,
          intensity = "Normal",
          font = font_with_fallback("Fira Code", {})
        },
        {
          italic = true,
          intensity = "Bold",
          font = font_with_fallback("Fira Code", {})
        }
      }
    else
      overrides.font = nil
      overrides.font_rules = nil
      overrides.font_antialias = nil
    end
    window:set_config_overrides(overrides)
  end
)

return {
 --[[  window_decorations           = "NONE", ]]
  enable_wayland               = true,
  --color_scheme                 ="nord",
  colors                       = dracula,
  hide_tab_bar_if_only_one_tab = true,
  tab_max_width                = 16,
  enable_scroll_bar            = false,
  initial_rows                 = 30,
  initial_cols                 = 100,
  window_background_opacity    = 0.96,
  window_padding               = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
  },
  text_background_opacity      = 1.0,

  exit_behavior                              = "Close",
  font_size                                  = 11,
  font                                       = font_with_fallback("JetBrainsMono Nerd Font", {}),
  font_rules                                 = {
    {
      italic = false,
      intensity = "Normal",
      font = font_with_fallback("JetBrainsMono Nerd Font", {})
    },
    {
      italic = false,
      intensity = "Bold",
      font = font_with_fallback("JetBrainsMono Nerd Font", {})
    },
    {
      italic = true,
      intensity = "Normal",
      font = font_with_fallback("JetBrainsMono Nerd Font", {})
    },
    {
      italic = true,
      intensity = "Bold",
      font = font_with_fallback("JetBrainsMono Nerd Font", {})
    }
  },

}
