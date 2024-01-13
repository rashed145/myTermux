set -e
printf "\e[1mDownloading configuration files...\e[0m\n"
curl --parallel-immediate -C - -ZfsSL \
	"https://raw.githubusercontent.com/rashed145/myTermux/master/{colorspec}" -o ~/bin/"#1" \
	"https://raw.githubusercontent.com/rashed145/myTermux/master/{bashrc,profile}" -o ~/".#1" \
	https://raw.githubusercontent.com/rashed145/myTermux/master/nanorc -o ~/.config/nano/nanorc --create-dirs

printf "\n\e[1mDownloading Theme and Font...\e[0m\n"
curl --parallel-immediate -C - -ZfsSL \
	https://raw.githubusercontent.com/termux/termux-styling/master/app/src/main/assets/colors/argonaut.properties -o ~/.termux/.colors/argonaut.properties \
	https://raw.githubusercontent.com/rashed145/polus-bash-theme/master/polus.bash-theme -o ~/.config/bash/themes/polus.bash-theme \
	https://github.com/rashed145/myTermux/blob/master/Caskaydia%20Cove%20Nerd%20Font%20Complete%20Regular.ttf?raw=true -o ~/.fonts/CascadiaCode.ttf --create-dirs
ln -sf ~/.fonts/CascadiaCode.ttf ~/.termux/font.ttf
ln -sf ~/.termux/{.colors/argonaut.properties,colors.properties}

printf "\n\e[1mChanging TERMUX settings...\e[0m\n"
mv ~/.termux/termux.properties{,~}
printf """\
allow-external-apps = true
disable-terminal-session-change-toast = true
terminal-transcript-rows = 4000
terminal-cursor-style = bar
bell-character = ignore
terminal-margin-horizontal=10
extra-keys=[['ESC','TAB','CTRL','ALT','-','LEFT','DOWN','UP','RIGHT']]
\n"""|tee ~/.termux/termux.properties
printf "TERMUX_HUSHLOGIN=1\n"|tee -a ~/.termux/motd.sh
test -w /sdcard||termux-setup-storage

printf "\n\e[1mUpdating...\e[0m\n"
printf "deb https://packages-cf.termux.dev/apt/termux-main/ stable main\n"|tee $PREFIX/etc/apt/sources.list
apt-get -q=2 update && yes|apt-get -q=2 dist-upgrade
printf "deb https://packages-cf.termux.dev/apt/termux-main/ stable main\n"|tee $PREFIX/etc/apt/sources.list
apt-get -q=2 update && yes|apt-get -q=2 install man pick

printf "\n\e[1mDownloading FFMPEG\e[0m\n"
curl --parallel-immediate -ZL \
	https://raw.githubusercontent.com/rashed145/myTermux/master/arm64-v8a-lite.tar.bz2 -O --output-dir ~/bin
tar xf ~/bin/arm64-v8a-lite.tar.bz2 -C ~/bin
rm ~/bin/arm64-v8a-lite.tar.bz2
chmod +x ~/bin/*
