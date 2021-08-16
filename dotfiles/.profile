# ~/.xsession
#

# set default cursor
  xsetroot -cursor_name left_ptr

# set mouse speed behaviour:
# fast:
# xset m 4 2
# normal:
  xset m 2 5
# slow:
# xset m 1 1

# increase key repeat rate
  xset r rate 280 20

 # Make DPMS take care of blanking screens; turn screensaver off
  xset dpms 1200 1800 2400
  xset s off

# Assign `Control` to the key labeled `Caps_Lock'
  setxkbmap -option ctrl:nocaps

# Ctrl+Alt+Backspace killing xserver
  setxkbmap -option terminate:ctrl_alt_bksp

# Start urxvtd
urxvtd -q -f -o

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK


# vim:set ai et sts=2 sw=2 tw=80:
