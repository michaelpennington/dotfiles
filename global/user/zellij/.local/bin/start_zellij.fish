#!/usr/bin/env fish
if not set -q ZELLIJ and (not set -q SSH_CLIENT or not set -q SSH_CONNECTION)
    if test "$ZELLIJ_AUTO_ATTACH" = "true"
        set args "attach -c"
    else
      set args
    end
    exec zellij $args
else
    exec fish
end
