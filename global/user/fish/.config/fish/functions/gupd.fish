set timefile "/home/mpennington/.cache/gupd/last-update"

function gupd
    read -p 'gcolor y "Update repositories?" w "[" g "a" w "/" m "g" w "/" r "N" w "] "' var
    switch $var
        case 'a' 'A' 'y' 'Y'
            if test -e "$timefile"
                set old_time (cat "$timefile")
                set now (date '+%s')
                if test (math "$old_time + 86400") -gt $now
                    set remaining (math "$old_time + 86400 - $now")
                    remaining $remaining | read -l amt unit
                    gcolor -n r "[Error] " "E81" "Please wait " "FFF" "$amt" "E81" " $unit to sync gentoo repo."
                    return 1
                end
            end
            gcolor -n g "Will update all repos"
            # sudo emaint sync -A || return 1
            echo "$now" > "$timefile"
        case 'g' 'G'
            set repos (cat /etc/portage/repos.conf/eselect-repo.conf | string match -ae '[' | string sub -s '2' -e '-1')
            for repo in $repos
                sudo emaint sync -r $repo || return 1
            end
    end
    sudo emerge -avuDN @world
end

function remaining
    set -l sec $argv[1]
    if test $sec -eq 1
        echo "1 second"
    else if test $sec -lt 60
        echo "$sec seconds"
    else if test $sec -lt 120
        echo "1 minute"
    else if test $sec -lt 3600
        set mins (math -s0 "$sec / 60")
        echo "$mins minutes"
    else if test $sec -lt 7200
        echo "1 hour"
    else
        set hrs (math -s0 "$sec / 3600")
        echo "$hrs hours"
    end
end

function gcolor
    set ind 1
    set newline "fl"
    if test $argv[1] = "-n"
        set newline "tr"
        set ind 2
    end

    set -l len (count $argv)
    while test $ind -le $len
        switch $argv[$ind]
            case 'd'
                set_color black
            case 'r'
                set_color red
            case 'g'
                set_color green
            case 'y'
                set_color yellow
            case 'b'
                set_color blue
            case 'm'
                set_color magenta
            case 'c'
                set_color cyan
            case 'w'
                set_color white
            case '*'
                set_color normal
        end
        if string match -q -r '^[0-9a-fA-F]{3}(?:[0-9a-fA-F]{3})?$' $argv[$ind]
            set_color $argv[$ind]
        end
        echo -n $argv[(math $ind + 1)]
        set_color normal
        set ind (math $ind + 2)
    end
    
    if test $newline = "tr"
        echo ""
    end
end
