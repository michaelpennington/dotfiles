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
    set -gx DIFFPROG 'lvim -d'
    set -gx EDITOR lvim
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

    zoxide init fish | source
    starship init fish | source
    bass source /etc/profile
    fish_add_path -P ~/.local/bin
    fish_add_path -P ~/.cargo/bin
    fish_add_path -P ~/JLink
    if set -q SSH_CLIENT; or set -q SSH_CONNECTION; or set -q WSL_DISTRO_NAME; or set -q WSLENV; or set -q WSL_INTEROP
        bass source /usr/bin/wayland_disablement.sh
    else
        bass source /usr/bin/wayland_enablement.sh
    end
end
