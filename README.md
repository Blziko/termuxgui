# TermuxGUI
A simple script launcher for Termux:X11 that simplifies your desktop environment setup on Android.

### Requirements
- bash
- [Termux:X11](https://github.com/termux/termux-x11)

### Installation
```bash
mkdir -p $PREFIX/opt
cd $PREFIX/opt
git clone https://github.com/Blziko/termuxgui
chmod +x termuxgui/autoinstall.sh
chmod +x termuxgui/gui.sh
bash termuxgui/autoinstall.sh
ln -sf termuxgui/gui.sh $PREFIX/bin/gui
cd
```

### Usage
```bash
gui
```