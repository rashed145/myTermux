set -e
echo -e "\e[1mDownloading configuration files...\e[0m\n"
curl -L https://raw.githubusercontent.com/rashed145/mytools/main/colorspec -o ~/bin/colorspec --create-dirs
curl -L https://raw.githubusercontent.com/rashed145/mytools/main/profile -o ~/.profile
curl -L https://raw.githubusercontent.com/rashed145/mytools/main/bashrc -o ~/.bashrc
curl -L https://raw.githubusercontent.com/rashed145/mytools/main/nanorc -o ~/.config/nano/nanorc --create-dirs
chmod +x ~/bin/*
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
echo -e "\n\e[1mDownloading Theme and Font...\e[0m\n"
curl -L https://raw.githubusercontent.com/termux/termux-styling/master/app/src/main/assets/colors/argonaut.properties -o ~/.termux/.colors/argonaut.properties --create-dirs
curl -L https://raw.githubusercontent.com/rashed145/polus-bash-theme/main/polus.bash_theme -o ~/.config/bash/themes/polus.bash-theme --create-dirs
curl -L https://github.com/ryanoasis/nerd-fonts/blob/v2.2.2/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf?raw=true -o ~/.termux/.fonts/Hack.ttf --create-dirs
ln -sf ~/.termux/{.fonts/Hack.ttf,font.ttf}
ln -sf ~/.termux/{.colors/argonaut.properties,colors.properties}
termux-setup-storage
echo -e "\n\e[1mUpdating...\e[0m\n"
echo "deb https://packages-cf.termux.org/apt/termux-main stable main"|tee $PREFIX/etc/apt/sources.list
apt update && yes|apt upgrade
echo "deb https://grimler.se/termux/termux-main stable main"|tee $PREFIX/etc/apt/sources.list
apt update && yes|apt install man fzf tree
