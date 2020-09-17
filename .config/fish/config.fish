# start X at login
set tty (tty)
if status is-interactive
    if test $tty = /dev/tty1
        exec startx ~/.config/X11/xinitrc
    end
end

# aliases
alias s "sudo"
alias c "clear"
alias v "nvim"
alias vim "nvim"
alias g "git"
alias gc "git clone"
alias gcm "git commit -m"
alias ga "git add"
alias gph "git push"
alias gpl "git pull"
alias gs "git status"
alias ka "killall"
alias rf "rm -rf"
alias av "sudo emerge -av"
alias pv "emerge -pv"
alias se "sudo emerge"
alias sync "sudo emaint sync -a"
alias xup "xrdb -load ~/.config/X11/xresources"
alias installed "cat /var/lib/portage/world"
alias ls "ls -a --group-directories-first --color=auto"
alias config='/usr/bin/git --git-dir=$HOME/Projects/dotfiles/ --work-tree=$HOME'
