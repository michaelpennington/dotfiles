#!/bin/fish

set -l lout "alsa_output.pci-0000_67_00.6.analog-stereo"

if test (pactl get-default-sink) = $lout
  pactl set-default-sink "bluez_output.EB_06_EF_D5_AB_07.1"
else
  pactl set-default-sink $lout
end
