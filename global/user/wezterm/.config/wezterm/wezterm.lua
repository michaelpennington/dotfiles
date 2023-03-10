local wezterm = require 'wezterm'

return {
  -- default_prog = { '/home/mpennington/.local/bin/start_zellij.fish' }
  color_scheme = "Gruvbox dark, pale (base16)",
  use_fancy_tab_bar = false,
  font = wezterm.font {
    family = 'Fantasque Sans Mono',
    harfbuzz_features = { 'ss01' }
  },
  font_size = 12.0, -- 🦀 CRAB!
  window_background_opacity = 0.92,
  allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace",
  -- term = "wezterm",
  xcursor_theme = "phinger-cursors",
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
  },
}
