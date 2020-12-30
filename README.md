## <p align="center">Details</p>

+ **OS**                : Gentoo
+ **WM**                : Bspwm
+ **HOTKEY DAEMON**     : Sxhkd
+ **BAR**               : Polybar
+ **TERMINAL**          : Urxvt
+ **SHELL**             : Fish
+ **EDITOR**            : Neovim
+ **TERMINAL FONT**     : JetBrainsMono
+ **BAR FONT**          : DejaVu Sans
+ **ICON FONTS**        : Font Awesome
+ **APP LAUNCHER**      : Dmenu
+ **MUSIC PLAYER**      : Mpd, Ncmpcpp
+ **BROWSER**           : Firefox [(startpage)](https://github.com/rajshekhar26/startpage)
+ **FILE MANAGER**      : Ranger
+ **NOTIFICATION**      : Dunst
+ **COMPOSITOR**        : [Picom](https://github.com/ibhagwan/picom)
+ **EMAIL**             : Neomutt
+ **VIDEO PLAYER**      : Mpv
+ **SYSTEM MONITOR**    : Htop
+ **SCREEN CAPTURE**    : Scrot
+ **IMAGE VIEWER**      : Feh
+ **DOCUMENT VIEWER**   : Zathura
+ **RSS READER**        : Newsboat

## <p align="center">Preview</p>

![screenshot](/Pictures/Screenshots/blossom1.png)

![screenshot](/Pictures/Screenshots/blossom2.png)

## <p align="center">Installation</p>

```shell
mv ~/.config ~/.config-bak
mv ~/.bash_profile ~/.bash_profile-bak
mkdir -p ~/.config/ ~/Projects/ ~/Pictures/Screenshots/
echo 'alias config="/usr/bin/git --git-dir=$HOME/Projects/dotfiles/ --work-tree=$HOME"' >> $HOME/.bashrc
source ~/.bashrc && mv ~/.bashrc ~/.bashrc-bak
echo "Projects/dotfiles" >> .gitignore
git clone --bare https://www.github.com/rajshekhar26/dotfiles $HOME/Projects/dotfiles
config checkout
config config --local status.showUntrackedFiles no
```
