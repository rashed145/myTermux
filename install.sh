set -e
echo -e "\e[1mDownloading configuration files...\e[0m\n"
curl -fsSL https://raw.githubusercontent.com/rashed145/myTermux/master/colorspec -o ~/bin/colorspec --create-dirs
curl -fsSL https://raw.githubusercontent.com/rashed145/myTermux/master/wp -o ~/bin/wp
curl -fsSL https://raw.githubusercontent.com/rashed145/myTermux/master/xdl -o ~/bin/xdl
curl -fsSL https://raw.githubusercontent.com/rashed145/myTermux/master/xhdl -o ~/bin/xhdl
curl -fsSL https://raw.githubusercontent.com/rashed145/myTermux/master/rtdl -o ~/bin/rtdl
curl -fsSL https://raw.githubusercontent.com/rashed145/myTermux/master/sbmb -o ~/bin/sbmb
curl -fsSL https://raw.githubusercontent.com/rashed145/myTermux/master/profile -o ~/.profile
curl -fsSL https://raw.githubusercontent.com/rashed145/myTermux/master/bashrc -o ~/.bashrc
[ -n "$TERMUX_VERSION" ] && curl -fsSL https://raw.githubusercontent.com/rashed145/myTermux/master/nanorc -o ~/.config/nano/nanorc --create-dirs||true
chmod +x ~/bin/*
echo -e "\n\e[1mDownloading Theme and Font...\e[0m\n"
curl -fsSL https://raw.githubusercontent.com/termux/termux-styling/master/app/src/main/assets/colors/argonaut.properties -o ~/.termux/.colors/argonaut.properties --create-dirs
curl -fsSL https://raw.githubusercontent.com/rashed145/polus-bash-theme/master/polus.bash-theme -o ~/.config/bash/themes/polus.bash-theme --create-dirs
curl -L https://github.com/rashed145/myTermux/blob/master/Caskaydia%20Cove%20Nerd%20Font%20Complete%20Regular.ttf?raw=true -o ~/.fonts/CascadiaCode.ttf --create-dirs
ln -sf ~/.fonts/CascadiaCode.ttf ~/.termux/font.ttf
ln -sf ~/.termux/{.colors/argonaut.properties,colors.properties}
echo -e "\n\e[1mChanging TERMUX settings...\e[0m\n"
echo """
allow-external-apps = true
disable-terminal-session-change-toast = true
terminal-transcript-rows = 3000
terminal-cursor-style = underline
bell-character = ignore
terminal-margin-horizontal=10
enforce-char-based-input = true
"""|tee -a ~/.termux/termux.properties
echo "TERMUX_HUSHLOGIN=1"|tee -a ~/.termux/motd.sh
termux-setup-storage
echo -e "\n\e[1mUpdating...\e[0m\n"
[ -n "$TERMUX_VERSION" ] && {
echo "deb https://packages-cf.termux.org/apt/termux-main stable main"|tee $PREFIX/etc/apt/sources.list
apt update && yes|apt dist-upgrade
echo "deb https://grimler.se/termux/termux-main stable main"|tee $PREFIX/etc/apt/sources.list
}||true
apt update && yes|apt install man tree python clang- python-ensurepip-wheels- aria2
echo -e "\n\e[1mDownloading YT-DLP & FFMPEG\e[0m"
aria2c -Z https://github.com/Khang-NT/ffmpeg-binary-android/releases/download/2018-07-31/arm64-v8a-lite.tar.bz2 https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -d ~/bin
tar xf ~/bin/arm64-v8a-lite.tar.bz2 -C ~/bin
rm ~/bin/arm64-v8a-lite.tar.bz2
chmod +x ~/bin/*
