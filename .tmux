#!/bin/sh

set -e

if tmux has-session -t virt 2> /dev/null; then
  if [ "$TMUX" = "" ];then
    tmux attach -t virt.left
  else
    tmux switch-client -t virt.left
  fi
  exit
fi

tmux new-session -d -s virt -n vim -x $(tput cols) -y $(tput lines)

tmux split-window -t virt:vim.right -h
tmux send-keys -t virt:vim.right "gss" Enter
tmux send-keys -t virt:vim.left "ssh Virtualization" Enter
tmux send-keys -t virt:vim.left "clear" Enter

if [ "$TMUX" = "" ];then
  tmux attach -t virt:vim.left
else
  tmux switch-client -t virt.left
fi
