if status is-interactive
    clear
    fish_vi_key_bindings
    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore
    set fish_cursor_visual block
    set -gx fish_vi_force_cursor
    fish_vi_cursor
    set -gx BROWSER /usr/bin/firefox
    set -gx LANG en_US.UTF-8
    set -gx LC_CTYPE en_US.UTF-8
    set -gx LANGUAGE en_US.UTF-8
    set -gx DIFFPROG 'nvim -d'
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
    set -gx CHROOT $HOME/chroot
    set -gx ASYMPTOTE_PSVIEWER "/usr/bin/zathura"
    set -gx ASYMPTOTE_PDFVIEWER "/usr/bin/zathura"

    abbr -a -- ll 'eza --icons -lah' 
    abbr -a -- llll 'eza --icons -lagh@T --git' 
    abbr -a -- cp 'cp -rv' 
    abbr -a -- lll 'eza --icons -lagh@ --git' 
    abbr -a -- mv 'mv -v' 
    abbr -a -- mkdir 'mkdir -vp' 
    abbr -a -- l 'eza --icons' 

    set -gx VISUAL "nvim"
    set -gx EDITOR "nvim"

    if command -q zoxide
      command zoxide init fish | source
    end
    if command -q starship
      and not string match -r "/dev/tty[0-9]*" (tty)
       command starship init fish | source
    end
    if test -x ~/.asdf/asdf.fish
      source ~/.asdf/asdf.fish
    end
    if test -d ~/.local/bin
      fish_add_path -P ~/.local/bin
    end
    if test -d ~/.cargo/bin
      fish_add_path -P ~/.cargo/bin
    end
end
