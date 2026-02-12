local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.automatically_reload_config = false
config.color_scheme = "Chalk"
config.font = wezterm.font_with_fallback({ "Iosevka SS02", "Iosevka Nerd Font" })
config.initial_cols = 160
config.initial_rows = 48
config.keys = {
  {
    mods = "SUPER",
    key = "Enter",
    action = wezterm.action.SendString("\x1B\x0A"),
  },
  {
    mods = "SHIFT",
    key = "Enter",
    action = wezterm.action.SendString("\x1B\x0D"),
  },
  {
    mods = "SUPER|SHIFT",
    key = "H",
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    mods = "SUPER|SHIFT",
    key = "L",
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    mods = "SUPER|SHIFT",
    key = "K",
    action = wezterm.action.ScrollToPrompt(-1),
  },
  {
    mods = "SUPER|SHIFT",
    key = "J",
    action = wezterm.action.ScrollToPrompt(1),
  },
  {
    mods = "SUPER|SHIFT",
    key = "<",
    action = wezterm.action.MoveTabRelative(-1),
  },
  {
    mods = "SUPER|SHIFT",
    key = ">",
    action = wezterm.action.MoveTabRelative(1),
  },
}
config.native_macos_fullscreen_mode = true
config.show_new_tab_button_in_tab_bar = false

wezterm.on("format-tab-title", function(tab)
  return " " .. tab.tab_index + 1 .. " "
end)

return config
