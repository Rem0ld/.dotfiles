-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "nightfox"
config.window_background_image = "/Users/pielov/Iterm/Images/Nord-Wallpapers/wallpapers/10.png"
config.window_background_image_hsb = {
	brightness = 0.2,
	saturation = 1.0,
}
config.window_background_opacity = 1
config.text_background_opacity = 0.9
config.colors = {
	split = "#444444",
}
config.window_padding = {
	left = 0,
	top = 0,
	right = 0,
	bottom = 0,
}
config.enable_tab_bar = false
config.font = wezterm.font("Fira Code Nerd Font", { weight = "Regular" })
config.font_size = 13

-- and finally, return the configuration to wezterm
return config
