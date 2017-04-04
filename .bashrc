### tmux
alias vi=vim
# starts tmux with 2 panes, the larger on the bottom
#alias ttmux="tmux new-session 'bash' \; split-window 'bash' \; select-layout main-horizontal"
alias ttmux="tmux new-session 'bash' \; split-window 'bash' \; split-window 'bash' \; select-layout even-vertical \; new-window 'bash' \; new-window 'bash' \; split-window 'bash' \; select-layout even-vertical \; new-window 'bash' \; select-window -t 1"

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
