#!/usr/bin/sh

alias cadence='gvncviewer torik:3' 

alias volup='amixer -D pulse -q sset Master 5%+'
alias voldown='amixer -D pulse -q sset Master 5%-'
alias voldw='voldown'
alias volup-fine='amixer -D pulse -q sset Master 2%+'
alias voldown-fine='amixer -D pulse -q sset Master 2%-'
alias voldw-fine='voldown-fine'
alias brup='sudo brightnessctl -d intel_backlight set +420'
alias brdw='sudo brightnessctl -d intel_backlight set 420-'
alias brdown='brdw'
alias brup-fine='sudo brightnessctl -d intel_backlight set +210'
alias brdw-fine='sudo brightnessctl -d intel_backlight set 210-'
alias suspend='systemctl suspend'
alias conn-headphones="echo -e 'power on\nscan on\nconnect 14:3F:A6:19:22:08\nexit' | bluetoothctl"
alias disconn-headphones="echo -e 'disconnect\nexit' | bluetoothctl"
alias easyeff="easyeffects --gapplication-service &"
alias gstat="git status"
alias floorp="/var/lib/flatpak/app/one.ablaze.floorp/current/active/export/bin/one.ablaze.floorp"

function edit {
  if [ $# -eq 0 ]; then
    echo "Usage: edit <filename>"
    return 1
  fi
  local file="$1"
  touch "$file" && nvim "$file"
}


function ecod {
  if [ $# -eq 0 ]; then
    echo "Usage: ecod <filename>"
    return 1
  fi
  local file="$1"
  touch "$file" && codium "$file"
}
