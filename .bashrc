#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
nvim() {
  kitty @set-colors background=\#1e1e2f 
  /sbin/nvim "$1"
  kitty @set-colors background=\#020012
}

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias batlev='upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep -E "state|to full|to empty|percentage"'
alias run='clang++ main.cpp -o main && ./main'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
#alias nvim='kitty @set-colors background=#1e1e2f && /sbin/nvim && kitty @set-colors background=#020012'
alias nmtui='nmcli device wifi rescan  && nmtui'
alias kb='hyprctl switchxkblayout lizhi-flash-ic-usb-keyboard 1'
PS1='[\u@\h \W]\$ '
alias fzf='fzf --preview="bat --color=always {} "'
eval "$(fzf --bash)"
alias matlab='~/matlab/bin/matlab'
alias Hyprland='start-hyprland'
alias TemplatePA='cp ~/PALab/PATemplate/templatepa/* -r .'
