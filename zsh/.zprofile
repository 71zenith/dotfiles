#!/bin/zsh

if [ "$TTY" = "/dev/tty1" ]; then
  exec startx ~/.config/X11/.xinitrc -- -keeptty 2> /dev/null
fi
