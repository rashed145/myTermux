# Installation
```
curl -L https://raw.githubusercontent.com/rashed145/mytools/main/colorspec -o ~/bin/colorspec --create-dirs
curl -L https://raw.githubusercontent.com/rashed145/mytools/main/tree -o ~/bin/tree
curl -L https://raw.githubusercontent.com/rashed145/mytools/main/.profile -o ~/.profile
curl -L https://raw.githubusercontent.com/rashed145/mytools/main/.bashrc -o ~/.bashrc
chmod +x ~/bin/*
echo """
allow-external-apps = true
disable-terminal-session-change-toast = true
terminal-transcript-rows = 3000
terminal-cursor-style = bar
bell-character = ignore
terminal-margin-horizontal=10
enforce-char-based-input = true
"""|tee -a ~/.termux/termux.properties
```
