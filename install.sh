set -e
dir=~
repo="https://raw.githubusercontent.com/rashed145/myTermux/master"
font="$repo/CaskaydiaCove.ttf"
color="https://raw.githubusercontent.com/termux/termux-styling/master/app/src/main/assets/colors/argonaut.properties"
theme="https://raw.githubusercontent.com/rashed145/polus-bash-theme/master/polus.bash-theme"
curl --parallel-immediate -C - -ZfsSL "$repo/{.bashrc,.profile,.nanorc,.aliases}" -o $dir/"#1" $color -o $dir/.termux/colors.properties $theme -o $dir/.config/bash/themes/theme.sh $font -o $dir/.termux/font.ttf --create-dirs
printf """\
allow-external-apps = true
disable-terminal-session-change-toast = true
terminal-transcript-rows = 4000
terminal-cursor-style = bar
bell-character = ignore
terminal-margin-horizontal=10
extra-keys=[['ESC','TAB','CTRL','ALT','-','LEFT','DOWN','UP','RIGHT']]
\n"""|tee -a $dir/.termux/termux.properties
printf "TERMUX_HUSHLOGIN=1\n"|tee -a $dir/.termux/motd.sh
test -w /sdcard||termux-setup-storage
printf "\e[1;92mDONE:\e[mConfiguration\n\n"
inia() { printf "deb https://packages-cf.termux.dev/apt/termux-main/ stable main\n"|tee $PREFIX/etc/apt/sources.list;apt-get -q=2 update; }
inia && yes|apt-get -q=2 dist-upgrade
inia && yes|apt-get -q=2 install man pick
printf "\e[1;92mDONE:\e[mApt setup\n\n"
curl --parallel-immediate -ZL $repo/arm64-v8a-lite.tar.bz2 -O --output-dir $dir/bin --create-dirs
tar xf $dir/bin/arm64-v8a-lite.tar.bz2 -C $dir/bin && rm $dir/bin/arm64-v8a-lite.tar.bz2 && chmod +x $dir/bin/*
printf "\e[1;93mADDED:\e[mFFMpeg\n"
