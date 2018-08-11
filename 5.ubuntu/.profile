# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

#mesg n || true
tty -s&&mesg n || true
pulseaudio --start --log-target=syslog
