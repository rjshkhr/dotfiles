## <p align="center">Details</p>

- **Operating System:** Arch Linux
- **Window Manager:** Qtile
- **Compositor:** Picom
- **Notification Daemon:** Dunst
- **Clipboard Manager:** Greenclip
- **Terminal:** Kitty
- **Terminal Font:** IosevkaTerm NFM
- **Shell:** Bash
- **Dynamic Menu:** Dmenu
- **Text Editor:** Neovim
- **File Manager:** Ranger
- **Document Viewer:** Zathura

## <p align="center">Installation</p>

```shell
mv ~/.config ~/.config-bak
mkdir -p ~/.config/ ~/Projects
echo "alias config='/usr/bin/git --git-dir=$HOME/Projects/dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
source ~/.bashrc
mv ~/.bashrc ~/.bashrc-bak && mv ~/.bash_profile ~/.bash_profile-bak
git clone --bare git@github.com:rjshkhr/dotfiles.git $HOME/Projects/dotfiles
config checkout
config config --local status.showUntrackedFiles no
```
