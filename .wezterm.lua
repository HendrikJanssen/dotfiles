local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Neutron"
config.font = wezterm.font("GeistMono Nerd Font Propo")
config.font_size = 15
config.use_fancy_tab_bar = false
--config.send_composed_key_when_left_alt_is_pressed = true
--config.send_composed_key_when_right_alt_is_pressed = true
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0", "zero=0" }
config.freetype_load_flags = "DEFAULT|NO_AUTOHINT"
config.window_decorations = "TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
config.native_macos_fullscreen_mode = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
return config
