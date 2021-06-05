## <p align="center">Details</p>

+ **OS**                : Gentoo
+ **WM**                : Bspwm
+ **HOTKEY DAEMON**     : Sxhkd
+ **BAR**               : Polybar
+ **TERMINAL**          : St and Urxvt
+ **SHELL**             : Bash
+ **EDITOR**            : Neovim
+ **TERMINAL FONT**     : Iosevka Term
+ **BAR FONT**          : Iosevka Term
+ **ICON FONTS**        : Font Awesome
+ **APP LAUNCHER**      : Dmenu
+ **MUSIC PLAYER**      : Mpd, Ncmpcpp
+ **BROWSER**           : Firefox [(startpage)](https://github.com/rajshekhar26/startpage)
+ **FILE MANAGER**      : Ranger
+ **NOTIFICATION**      : Dunst
+ **COMPOSITOR**        : [Picom](https://github.com/ibhagwan/picom)
+ **EMAIL**             : Neomutt
+ **VIDEO PLAYER**      : Mpv
+ **SCREEN CAPTURE**    : Scrot
+ **DOCUMENT VIEWER**   : Zathura
+ **RSS READER**        : Newsboat

## <p align="center">Installation</p>

```shell
mv ~/.config ~/.config-bak
mv ~/.bash_profile ~/.bash_profile-bak
mkdir -p ~/.config/ ~/Projects
echo 'alias config="/usr/bin/git --git-dir=$HOME/Projects/dotfiles/ --work-tree=$HOME"' >> $HOME/.bashrc
source ~/.bashrc && mv ~/.bashrc ~/.bashrc-bak
echo "Projects/dotfiles" >> .gitignore
git clone --bare git@github.com:rajshekhar26/restaurant-page.git $HOME/Projects/dotfiles
config checkout
config config --local status.showUntrackedFiles no
```
