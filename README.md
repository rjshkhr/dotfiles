## <p align="center">Details</p>

-   **Operating System:** Arch Linux
-   **Window Manager:** Bspwm
-   **Hotkey Daemon:** Sxhkd
-   **Compositor:** Picom
-   **Status Bar:** Polybar
-   **Notification Daemon:** Dunst
-   **Clipboard Manager:** Greenclip
-   **Terminal:** Kitty
-   **Terminal Font:** FantasqueSansM Nerd Font
-   **Shell:** Zsh
-   **Dynamic Menu:** Dmenu
-   **Text Editor:** Neovim
-   **File Manager:** Ranger, Nemo
-   **Document Viewer:** Zathura

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
