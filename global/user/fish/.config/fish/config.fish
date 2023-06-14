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

    abbr -a -- ls 'exa --icons' # imported from a universal variable, see `help abbr`
    abbr -a -- ll 'exa --icons -lah' # imported from a universal variable, see `help abbr`
    abbr -a -- llll 'exa --icons -lagh@T --git' # imported from a universal variable, see `help abbr`
    abbr -a -- cp 'cp -rv' # imported from a universal variable, see `help abbr`
    abbr -a -- lll 'exa --icons -lagh@ --git' # imported from a universal variable, see `help abbr`
    abbr -a -- mv 'mv -v' # imported from a universal variable, see `help abbr`
    abbr -a -- nvim lvim # imported from a universal variable, see `help abbr`
    abbr -a -- vi lvim # imported from a universal variable, see `help abbr`
    abbr -a -- mkdir 'mkdir -vp' # imported from a universal variable, see `help abbr`
    abbr -a -- vim lvim # imported from a universal variable, see `help abbr`
    abbr -a -- l 'exa --icons' # imported from a universal variable, see `help abbr`

    # alias pacs='pacman --color always -Sl | sed -e "s: :/:; /installed/d" | cut -f 1 -d " " | fzf --multi --ansi --preview "pacman -Si {1}" | xargs -ro sudo pacman -S'

    zoxide init fish | source
    starship init fish | source
    bass source /etc/profile
    fish_add_path -P ~/.local/bin
    fish_add_path -P ~/.cargo/bin
    if set -q SSH_CLIENT; or set -q SSH_CONNECTION; or set -q WSL_DISTRO_NAME; or set -q WSLENV; or set -q WSL_INTEROP
        bass source /usr/bin/wayland_disablement.sh
    else
        bass source /usr/bin/wayland_enablement.sh
    end

    theme_gruvbox dark medium
end
