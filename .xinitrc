#! /bin/sh

# # Change CAPS -> CTRL
setxkbmap -layout us -variant "" -option ctrl:nocaps
xkbcomp -I"$HOME/.xkb" "$HOME/.xkb/usim.xkb" $DISPLAY 2>/dev/null

while true; do
    d=$(date)
    b=$(acpi -b)
    echo " " $d " - " $b
    sleep 1
done | dzen2 -dock -p -ta l &

xss-lock slock &

[[ -f ~/.x-local-config ]] && . ~/.x-local-config

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


emacs --daemon -f exwm-enable
exec emacsclient -c	 


#exec gnome-session
