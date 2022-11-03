#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}
xrandr --output HDMI-0 --primary --mode 3440x1440 --pos 0x0 --rotate normal --output eDP-1-1 --mode 1920x1080 --pos 3440x0 --rotate normal
#xrandr --output HDMI-0 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output eDP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal
#run xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#run xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
run nm-applet
#you can set wallpapers in themes as well
feh -g -0+0 --bg-fill $HOME/.backgrounds/wallpaper1.png &
#run applications from startup
#run firefox
#run atom
run superproductivity
