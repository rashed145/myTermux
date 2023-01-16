set -e
echo -e "\e[1mDownloading configuration files...\e[0m\n"
curl -fsSL https://raw.githubusercontent.com/rashed145/myTermux/master/colorspec -o ~/bin/colorspec --create-dirs
curl -fsSL https://raw.githubusercontent.com/rashed145/myTermux/master/wp -o ~/bin/wp
curl -fsSL https://raw.githubusercontent.com/rashed145/myTermux/master/sbmb -o ~/bin/sbmb
curl -fsSL https://raw.githubusercontent.com/rashed145/myTermux/master/profile -o ~/.profile
curl -fsSL https://raw.githubusercontent.com/rashed145/myTermux/master/bashrc -o ~/.bashrc
[ -n "$TERMUX_VERSION" ] && curl -fsSL https://raw.githubusercontent.com/rashed145/myTermux/master/nanorc -o ~/.config/nano/nanorc --create-dirs||true
chmod +x ~/bin/*
echo -e "\n\e[1mDownloading Theme and Font...\e[0m\n"
curl -fsSL https://raw.githubusercontent.com/termux/termux-styling/master/app/src/main/assets/colors/argonaut.properties -o ~/.termux/.colors/argonaut.properties --create-dirs
curl -fsSL https://raw.githubusercontent.com/rashed145/polus-bash-theme/master/polus.bash-theme -o ~/.config/bash/themes/polus.bash-theme --create-dirs
curl -L https://github.com/ryanoasis/nerd-fonts/blob/v2.2.2/patched-fonts/FiraCode/Medium/complete/Fira%20Code%20Medium%20Nerd%20Font%20Complete.ttf?raw=true -o ~/.termux/.fonts/FiraCode.ttf --create-dirs
ln -sf ~/.termux/{.fonts/FiraCode.ttf,font.ttf}
ln -sf ~/.termux/{.colors/argonaut.properties,colors.properties}
echo -e "\n\e[1mChanging TERMUX settings...\e[0m\n"
echo """
allow-external-apps = true
disable-terminal-session-change-toast = true
terminal-transcript-rows = 3000
terminal-cursor-style = bar
bell-character = ignore
terminal-margin-horizontal=10
enforce-char-based-input = true
"""|tee -a ~/.termux/termux.properties
echo "TERMUX_HUSHLOGIN=1"|tee -a ~/.termux/motd.sh
termux-setup-storage
echo -e "\n\e[1mUpdating...\e[0m\n"
[ -n "$TERMUX_VERSION" ] && {
echo "deb https://packages-cf.termux.org/apt/termux-main stable main"|tee $PREFIX/etc/apt/sources.list
apt update && yes|apt full-upgrade
echo "deb https://grimler.se/termux/termux-main stable main"|tee $PREFIX/etc/apt/sources.list
}||true
apt update && yes|apt install man tree
