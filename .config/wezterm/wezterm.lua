local wezterm = require("wezterm")
local shadow = require("shadow")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("CaskaydiaCove Nerd Font")
config.font_size = 13
config.line_height = 1.4
config.window_padding = {
	left = 36,
	right = 36,
	top = 36,
	bottom = 36,
}
config.window_close_confirmation = "NeverPrompt"
config.audible_bell = "Disabled"
config.colors = shadow.colors
config.tab_max_width = 20
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.automatically_reload_config = true
config.default_cursor_style = "SteadyBar"

return config
