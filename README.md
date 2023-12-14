## <p align="center">Details</p>

- **OS** : Arch
- **WM** : Bspwm
- **HOTKEY DAEMON** : Sxhkd
- **BAR** : Polybar
- **TERMINAL** : Kitty
- **SHELL** : Zsh
- **EDITOR** : Neovim
- **TERMINAL FONT** : SpaceMono Nerd Font Mono
- **APP LAUNCHER** : Dmenu
- **FILE MANAGER** : Ranger, Nemo
- **NOTIFICATION** : Dunst
- **COMPOSITOR** : Picom
- **SCREEN CAPTURE** : Maim
- **CLIPBOARD MANAGER** : Greenclip

## <p align="center">Screenshots</p>

![screenshot](https://i.imgur.com/wxYaIJD.png)

![screenshot](https://i.imgur.com/pLfu66t.png)

## <p align="center">Installation</p>

```shell
mv ~/.config ~/.config-bak
mkdir -p ~/.config/ ~/Projects
echo 'alias config="/usr/bin/git --git-dir=$HOME/Projects/dotfiles/ --work-tree=$HOME"' >> $HOME/.bashrc
source ~/.bashrc
echo "Projects/dotfiles" >> .gitignore
git clone --bare git@github.com:rajshekhar26/dotfiles.git $HOME/Projects/dotfiles
config checkout
config config --local status.showUntrackedFiles no
```
