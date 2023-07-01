local wezterm = require 'wezterm'

local font_size = 12
local hostname_file = io.open("/etc/hostname", "r")
if (hostname_file ~= nil and hostname_file:read() == "COMPY10500")
then
  font_size = 15.5
end

return {
  -- default_prog = { '/home/mpennington/.local/bin/start_zellij.fish' }
  color_scheme = "Gruvbox dark, pale (base16)",
  use_fancy_tab_bar = false,
  font = wezterm.font {
    family = 'Fantasque Sans Mono',
    harfbuzz_features = { 'ss01' }
  },
  font_size = font_size, -- 🦀 CRAB!
  window_background_opacity = 0.92,
  allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace",
  -- term = "wezterm",
  -- xcursor_theme = "phinger-cursors",
  xcursor_size = 24,
  window_decorations = "NONE",
  keys = {
    {
      key = '_',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
      key = '|',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      key = 'j',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.ActivatePaneDirection 'Down'
    },
    {
      key = 'k',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.ActivatePaneDirection 'Up'
    },
    {
      key = 'h',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.ActivatePaneDirection 'Left'
    },
    {
      key = 'l',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.ActivatePaneDirection 'Right'
    },
    {
      key = 'h',
      mods = 'ALT',
      action = wezterm.action.ActivateTabRelative(-1)
    },
    {
      key = 'l',
      mods = 'ALT',
      action = wezterm.action.ActivateTabRelative(1)
    },
  },
}
