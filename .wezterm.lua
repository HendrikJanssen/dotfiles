local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Neutron"
config.font = wezterm.font("GeistMono Nerd Font Propo")
config.font_size = 14
config.use_fancy_tab_bar = false

return config
