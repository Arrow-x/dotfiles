local wezterm = require("wezterm")
local config = wezterm.config_builder()
-- config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 12
config.color_scheme = "Tokyo Night (Gogh)"
config.colors = {
	-- foreground = "#dddddd",
	background = "#000000",
}
config.window_background_opacity = 0.9
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
return config
