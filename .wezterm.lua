local wezterm = require("wezterm")

local is_darwin <const> = wezterm.target_triple:find("darwin") ~= nil
local is_linux <const> = wezterm.target_triple:find("linux") ~= nil

local config = wezterm.config_builder()

config.color_scheme = "Neutron"
config.font = wezterm.font("GeistMono Nerd Font Propo")
config.font_size = 15
config.use_fancy_tab_bar = false
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0", "zero=0" }
config.freetype_load_flags = "DEFAULT|NO_AUTOHINT"
config.window_decorations = "TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true
config.native_macos_fullscreen_mode = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.disable_default_key_bindings = true

local act = wezterm.action
config.keys = {
	{
		key = "t",
		mods = "CTRL",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "+",
		mods = "CTRL",
		action = act.IncreaseFontSize,
	},
	{
		key = "-",
		mods = "CTRL",
		action = act.DecreaseFontSize,
	},
}

for i = 1, 8 do
	-- CTRL + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL",
		action = act.ActivateTab(i - 1),
	})
end

return config
