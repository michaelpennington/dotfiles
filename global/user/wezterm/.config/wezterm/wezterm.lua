local wezterm = require 'wezterm'

return {
  default_prog = { '/home/mpennington/.local/bin/start_zellij.fish' },
  color_scheme = "Gruvbox dark, pale (base16)",
  font = wezterm.font {
    family = 'Fantasque Sans Mono',
    harfbuzz_features = { 'ss01' }
  },
  font_size = 12.0, -- 🦀 CRAB!
  enable_tab_bar = false,
  window_background_opacity = 0.92,
  allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace",
  -- term = "wezterm",
  xcursor_theme = "phinger-cursors",
  xcursor_size = 24,
  window_decorations = "NONE",
}
