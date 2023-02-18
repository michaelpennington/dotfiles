function fish_greeting
  echo Good (print_tod), (set_color magenta)$USER(set_color normal)! Welcome to (set_color red)$hostname(set_color normal).\n
  echo -ns \t"The date is " (set_color yellow; date +"%A"; set_color normal) ", "
  echo -ns (set_color green; date +"%B %e"; set_color normal) ", "
  echo -s (set_color blue; date +"%Y"; set_color normal) "."
  echo -s \t"The time is " (set_color cyan; date +"%r"; set_color normal) "."
end

function print_tod
  set -l hour (date "+%H")
  if test \( $hour -gt 3 \) -a \( $hour -lt 12 \)
    echo morning
  else if test \( $hour -ge 12 \) -a \( $hour -lt 18 \)
    echo afternoon
  else
    echo evening
  end
end
