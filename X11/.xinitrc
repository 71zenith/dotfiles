xsetroot -cursor_name left_ptr
setxkbmap -option caps:escape
xrdb -merge ~/.config/X11/.Xresources
xset r rate 300 50
exec bspwm
