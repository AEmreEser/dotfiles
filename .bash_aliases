#!/usr/bin/sh

alias cadence='gvncviewer torik:3' 
alias epfl-vpn='sudo openconnect --protocol=anyconnect --server=vpn.epfl.ch --user=aeser --useragent=AnyConnect'

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
