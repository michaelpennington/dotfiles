#!/usr/bin/fish

function switch_audio
  set -l options (fish_opt -s t -l toggle)
  set -al options (fish_opt -s b -l bluetooth)
  set -al options (fish_opt -s p -l headphones)
  set -al options (fish_opt -s s -l speakers)
  set -al options (fish_opt -s h -l help)
  argparse -x toggle,bluetooth,headphones,speakers
end
