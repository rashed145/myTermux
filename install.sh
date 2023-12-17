set -e
echo -e "\e[1mDownloading configuration files...\e[0m\n"
curl --parallel-immediate -C - -ZfsSL \
	"https://raw.githubusercontent.com/rashed145/myTermux/master/{colorspec}" -o ~/bin/"#1" \
	"https://raw.githubusercontent.com/rashed145/myTermux/master/{bashrc,profile}" -o ~/".#1" \
	https://raw.githubusercontent.com/rashed145/myTermux/master/nanorc -o ~/.config/nano/nanorc --create-dirs

echo -e "\n\e[1mDownloading Theme and Font...\e[0m\n"
curl --parallel-immediate -C - -ZfsSL \
	https://raw.githubusercontent.com/termux/termux-styling/master/app/src/main/assets/colors/argonaut.properties -o ~/.termux/.colors/argonaut.properties \
	https://raw.githubusercontent.com/rashed145/polus-bash-theme/master/polus.bash-theme -o ~/.config/bash/themes/polus.bash-theme \
	https://github.com/rashed145/myTermux/blob/master/Caskaydia%20Cove%20Nerd%20Font%20Complete%20Regular.ttf?raw=true -o ~/.fonts/CascadiaCode.ttf --create-dirs
ln -sf ~/.fonts/CascadiaCode.ttf ~/.termux/font.ttf
ln -sf ~/.termux/{.colors/argonaut.properties,colors.properties}

echo -e "\n\e[1mChanging TERMUX settings...\e[0m\n"
mv ~/.termux/termux.properties{,~}
echo """\
allow-external-apps = true
disable-terminal-session-change-toast = true
terminal-transcript-rows = 4000
terminal-cursor-style = bar
bell-character = ignore
terminal-margin-horizontal=10
extra-keys=[['ESC','TAB','CTRL','ALT','-','LEFT','DOWN','UP','RIGHT']]
"""|tee ~/.termux/termux.properties
echo "TERMUX_HUSHLOGIN=1"|tee -a ~/.termux/motd.sh
test -w /sdcard||termux-setup-storage

echo -e "\n\e[1mUpdating...\e[0m\n"
echo "deb https://packages-cf.termux.dev/apt/termux-main/ stable main"|tee $PREFIX/etc/apt/sources.list
apt-get -q=2 update && yes|apt-get -q=2 dist-upgrade
echo "deb https://packages-cf.termux.dev/apt/termux-main/ stable main"|tee $PREFIX/etc/apt/sources.list
apt-get -q=2 update && yes|apt-get -q=2 install man pick --no-install-recommends

echo -e "\n\e[1mDownloading FFMPEG\e[0m"
curl --parallel-immediate -ZL \
	https://raw.githubusercontent.com/rashed145/myTermux/master/arm64-v8a-lite.tar.bz2 -O --output-dir ~/bin
tar xf ~/bin/arm64-v8a-lite.tar.bz2 -C ~/bin
rm ~/bin/arm64-v8a-lite.tar.bz2
chmod +x ~/bin/*
