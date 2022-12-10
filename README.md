# Installation
```
curl -L https://raw.githubusercontent.com/rashed145/mytools/main/colorspec -o ~/bin/colorspec --create-dirs
curl -L https://raw.githubusercontent.com/rashed145/mytools/main/tree -o ~/bin/tree
chmod +x ~/bin/*
colorspec &>/dev/null||echo PATH="$PATH:~/bin"|tee -a ~/.profile
```
