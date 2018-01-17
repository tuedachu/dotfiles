#! /bin/sh

# Change CAPS -> CTRL
setxkbmap -option ctrl:nocaps

while true; do
    date
    sleep 1
done  | dzen2 -dock -p -ta l &

emacs --daemon -f exwm-enable
exec emacsclient -c	       	


