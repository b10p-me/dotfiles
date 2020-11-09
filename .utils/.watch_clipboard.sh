#!/bin/bash
set -euo pipefail

LOCK=~/.tmux_buffer.lock
FILE_DESCRIPTOR_NUMBER=9 #I think 9 is just a random file descriptor, chosen because it's not 0 (STDIN), 1 (STDOUT) or 2 (ERROUT)
(
  flock --exclusive --nonblock 9 || exit 1
  
  ## WindowsClipboard Function, only use with KiTTY or modified Putty
  function wclip {
    echo -ne '\e''[5i'
    cat $*
    echo -ne '\e''[4i'
  }
  
  BUF=~/.tmux_buffer
  touch $BUF
  while inotifywait --quiet --quiet --event close_write $BUF; do
    cat ~/.tmux_buffer | wclip;
  done
) 9>$LOCK;
