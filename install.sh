set -e
echo -e "\e[1mDownloading configuration files...\e[0m\n"
curl --parallel-immediate -C - -ZfsSL \
	"https://raw.githubusercontent.com/rashed145/myTermux/master/{colorspec,wp,sbmb,xdl,xhdl,rtdl}" -o ~/bin/"#1" \
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
echo """
allow-external-apps = true
disable-terminal-session-change-toast = true
terminal-transcript-rows = 3000
terminal-cursor-style = bar
bell-character = ignore
terminal-margin-horizontal=10
"""|tee ~/.termux/termux.properties
echo "TERMUX_HUSHLOGIN=1"|tee -a ~/.termux/motd.sh
test -w /sdcard||termux-setup-storage

echo -e "\n\e[1mUpdating...\e[0m\n"
echo "deb https://packages-cf.termux.org/apt/termux-main stable main"|tee $PREFIX/etc/apt/sources.list
apt update && yes|apt dist-upgrade
echo "deb https://grimler.se/termux/termux-main stable main"|tee $PREFIX/etc/apt/sources.list
apt update && yes|apt install man tree python clang- python-ensurepip-wheels- aria2

echo -e "\n\e[1mDownloading YT-DLP & FFMPEG\e[0m"
curl --parallel-immediate -ZL \
	https://github.com/Khang-NT/ffmpeg-binary-android/releases/download/2018-07-31/arm64-v8a-lite.tar.bz2 -O \
	https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O --output-dir ~/bin
tar xf ~/bin/arm64-v8a-lite.tar.bz2 -C ~/bin
rm ~/bin/arm64-v8a-lite.tar.bz2
chmod +x ~/bin/*
