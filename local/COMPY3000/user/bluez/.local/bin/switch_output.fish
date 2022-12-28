#!/bin/fish

if test (pactl get-default-sink) = "alsa_output.pci-0000_03_00.6.analog-stereo"
  pactl set-default-sink "bluez_output.EB_06_EF_D5_AB_07.1"
else
  pactl set-default-sink "alsa_output.pci-0000_03_00.6.analog-stereo"
end

