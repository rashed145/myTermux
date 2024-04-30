set -e
dir=~
apt-get -q=1 update && yes|apt-get -q=1 dist-upgrade man pick && apt-get -q=1 update
test -w /sdcard||termux-setup-storage
>$dir/.hushlogin
d="https://raw.githubusercontent.com"
repo="$d/rashed145/myTermux/master"
font="$repo/CaskaydiaCove.ttf"
color="$d/termux/termux-styling/master/app/src/main/assets/colors/argonaut.properties"
theme="$d/rashed145/polus-bash-theme/master/polus.bash-theme"
curl --parallel-immediate -C - -ZfsSL "$repo/{.bashrc,.profile,.nanorc,.aliases}" -o $dir/"#1" $color -o $dir/.termux/colors.properties $theme -o $dir/.config/bash/themes/theme.sh $font -o $dir/.termux/font.ttf --create-dirs
echo """
allow-external-apps = true
disable-terminal-session-change-toast = true
terminal-transcript-rows = 3000
terminal-cursor-style = bar
bell-character = ignore
terminal-margin-horizontal=10
""" >> $dir/.termux/termux.properties
