#!/bin/sh

setxkbmap -option caps:escape
xsetroot -cursor_name left_ptr
xset r rate 300 50
exec bspwm
