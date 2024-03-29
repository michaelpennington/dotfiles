complete -c podcast -n "__fish_use_subcommand" -s h -l help -d 'Print help information'
complete -c podcast -n "__fish_use_subcommand" -s V -l version -d 'Print version information'
complete -c podcast -n "__fish_use_subcommand" -s q -l quiet -d 'Output less stuff'
complete -c podcast -n "__fish_use_subcommand" -f -a "download" -d 'download episodes of podcast'
complete -c podcast -n "__fish_use_subcommand" -f -a "ls" -d 'list episodes of podcast'
complete -c podcast -n "__fish_use_subcommand" -f -a "list" -d 'list episodes of podcast'
complete -c podcast -n "__fish_use_subcommand" -f -a "play" -d 'play an episode'
complete -c podcast -n "__fish_use_subcommand" -f -a "search" -d 'searches for podcasts'
complete -c podcast -n "__fish_use_subcommand" -f -a "subscribe" -d 'subscribes to a podcast RSS feed'
complete -c podcast -n "__fish_use_subcommand" -f -a "sub" -d 'subscribes to a podcast RSS feed'
complete -c podcast -n "__fish_use_subcommand" -f -a "refresh" -d 'refresh subscribed podcasts'
complete -c podcast -n "__fish_use_subcommand" -f -a "update" -d 'check for updates'
complete -c podcast -n "__fish_use_subcommand" -f -a "rm" -d 'unsubscribe from a podcast'
complete -c podcast -n "__fish_use_subcommand" -f -a "completion" -d 'install shell completion'
complete -c podcast -n "__fish_use_subcommand" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c podcast -n "__fish_seen_subcommand_from download" -s l -l latest -d 'Downloads this many of the latest episodes' -r
complete -c podcast -n "__fish_seen_subcommand_from download" -s p -l pattern -d 'Download episode names matching the given regex string' -r
complete -c podcast -n "__fish_seen_subcommand_from download" -s t -l template -d 'Name the downloaded file according to the provided template. Supports {title} and {number}.' -r
complete -c podcast -n "__fish_seen_subcommand_from download" -s e -l episode -d 'Download using episode name instead of index number'
complete -c podcast -n "__fish_seen_subcommand_from download" -s a -l all -d 'Download all matching episodes'
complete -c podcast -n "__fish_seen_subcommand_from download" -s h -l help -d 'Print help information'
complete -c podcast -n "__fish_seen_subcommand_from ls" -s h -l help -d 'Print help information'
complete -c podcast -n "__fish_seen_subcommand_from list" -s h -l help -d 'Print help information'
complete -c podcast -n "__fish_seen_subcommand_from play" -s e -l episode -d 'Play using episode name instead of index number'
complete -c podcast -n "__fish_seen_subcommand_from play" -s h -l help -d 'Print help information'
complete -c podcast -n "__fish_seen_subcommand_from search" -s d -d 'print debug information verbosely'
complete -c podcast -n "__fish_seen_subcommand_from search" -s h -l help -d 'Print help information'
complete -c podcast -n "__fish_seen_subcommand_from subscribe" -s h -l help -d 'Print help information'
complete -c podcast -n "__fish_seen_subcommand_from sub" -s h -l help -d 'Print help information'
complete -c podcast -n "__fish_seen_subcommand_from refresh" -s h -l help -d 'Print help information'
complete -c podcast -n "__fish_seen_subcommand_from update" -s h -l help -d 'Print help information'
complete -c podcast -n "__fish_seen_subcommand_from rm" -s h -l help -d 'Print help information'
complete -c podcast -n "__fish_seen_subcommand_from completion" -s h -l help -d 'Print help information'
