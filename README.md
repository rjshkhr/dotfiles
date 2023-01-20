## <p align="center">Details</p>

- **OS** : Arch
- **WM** : Bspwm
- **HOTKEY DAEMON** : Sxhkd
- **BAR** : Polybar
- **TERMINAL** : Alacritty
- **SHELL** : Zsh
- **EDITOR** : Neovim
- **TERMINAL FONT** : SpaceMono Nerd Font Mono
- **BAR FONT** : SpaceMono Nerd Font Mono
- **APP LAUNCHER** : Dmenu
- **MUSIC PLAYER** : Mpd, Ncmpcpp
- **BROWSER** : Firefox [(startpage)](https://github.com/rajshekhar26/startpage)
- **FILE MANAGER** : Ranger, Nemo
- **NOTIFICATION** : Dunst
- **COMPOSITOR** : [Picom](https://github.com/ibhagwan/picom)
- **VIDEO PLAYER** : Mpv
- **SCREEN CAPTURE** : Maim
- **DOCUMENT VIEWER** : Zathura
- **CLIPBOARD MANAGER** : Greenclip

## <p align="center">Screenshots</p>

![screenshot](https://i.imgur.com/wxYaIJD.png)

![screenshot](https://i.imgur.com/pLfu66t.png)

## <p align="center">Installation</p>

```shell
mv ~/.config ~/.config-bak
mv ~/.bash_profile ~/.bash_profile-bak
mkdir -p ~/.config/ ~/Projects
echo 'alias config="/usr/bin/git --git-dir=$HOME/Projects/dotfiles/ --work-tree=$HOME"' >> $HOME/.bashrc
source ~/.bashrc && mv ~/.bashrc ~/.bashrc-bak
echo "Projects/dotfiles" >> .gitignore
git clone --bare git@github.com:rajshekhar26/dotfiles.git $HOME/Projects/dotfiles
config checkout
config config --local status.showUntrackedFiles no
```
