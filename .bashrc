### 1) Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# for tmuxinator
export EDITOR="vim"

### 2) Common .bashrc among all dev env's

alias lsal="ls -al"
alias vi=vim
alias src_bashrc="source ~/.bashrc"

### Change prompt to be more helpful
#export PS1='$(whoami)@$(hostname):$(pwd)$ ' # <- grabs full path...too long.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1='\[\033[36;40m\]$(whoami)@$(hostname):${PWD##*/}$(parse_git_branch)$\[\033[0m\] '

### tmux
alias tmux="tmux -2"
# starts tmux with 2 panes, the larger on the bottom
#alias ttmux="tmux new-session 'bash' \; split-window 'bash' \; select-layout main-horizontal"
alias ttmux="tmux new-session 'bash' \; split-window 'bash' \; split-window 'bash' \; select-layout even-vertical \; new-window 'bash' \; new-window 'bash' \; split-window 'bash' \; select-layout even-vertical \; new-window 'bash' \; set -g status-right ' #(TZ=\"America/New_York\" date +\"%%l:%%M:%%P %%m/%%d\") ' \; select-window -t 1"

function ttmux2 {
  cddev
  tmux new-session -s ttmux 'bash'
  tmux split-window -t "ttmux" 'bash'
  tmux split-window 'bash'
  tmux select-layout even-vertical
  tmux rename-window 'cmd'
  tmux new-window 'bash'
  tmux rename window 'vim'
  tmux new-window 'bash'
  tmux select-window -t 1
}


### 3) Source local  definitions
if [ -f ~/.bashrc.local ]; then
  . ~/.bashrc.local
fi
