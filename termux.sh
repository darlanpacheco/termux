pkg update -y
pkg upgrade -y

pkg install -y x11-repo
pkg install -y xfce4 tigervnc neovim

# proot-distro install archlinux

VNC_PASSWORD="1579"
echo ${VNC_PASSWORD} | vncpasswd -f >~/.vnc/passwd
chmod 600 ~/.vnc/passwd

cat >~/.vnc/xstartup <<'EOF'
#!/data/data/com.termux/files/usr/bin/sh

unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
export DISPLAY=:1

startxfce4 &
EOF

chmod +x ~/.vnc/xstartup

vncserver :1 -geometry 1280x720 -depth 24
echo "vnc: localhost:5901"
echo "password: ${VNC_PASSWORD}"
echo "stop vnc: vncserver -kill :1"
