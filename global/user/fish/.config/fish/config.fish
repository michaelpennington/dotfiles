if status is-interactive
    fish_vi_key_bindings
    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore
    set fish_cursor_visual block
    set -gx fish_vi_force_cursor
    fish_vi_cursor
    set -gx CC /usr/bin/clang
    set -gx BROWSER /usr/bin/firefox
    set -gx CXX /usr/bin/clang++
    set -gx LD /usr/bin/ld.lld
    set -gx CC_LD /usr/bin/ld.lld
    set -gx CXX_LD /usr/bin/ld.lld
    set -gx LANG en_US.UTF-8
    set -gx LC_CTYPE en_US.UTF-8
    set -gx LANGUAGE en_US.UTF-8
    set -gx DIFFPROG 'lvim -d'
    set -gx EDITOR lvim
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
    set -gx CHROOT $HOME/chroot

    # alias pacs='pacman --color always -Sl | sed -e "s: :/:; /installed/d" | cut -f 1 -d " " | fzf --multi --ansi --preview "pacman -Si {1}" | xargs -ro sudo pacman -S'

    zoxide init fish | source
    starship init fish | source
    fish_add_path -P -a ~/.local/bin
    fish_add_path -P -a ~/.cargo/bin
    bass source /etc/profile
    echo $status
    if set -q SSH_CLIENT; or set -q SSH_CONNECTION; or set -q WSL_DISTRO_NAME; or set -q WSLENV; or set -q WSL_INTEROP
        bass source /usr/bin/wayland_disablement.sh
    else
        bass source /usr/bin/wayland_enablement.sh
    end
end
