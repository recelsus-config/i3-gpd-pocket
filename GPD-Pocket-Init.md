# Packages

`
sudo
base-devel
vim
neovim
git
iwd
tlp
rustup

xorg-init
xorg
i3
dmenu

noto-fonts-cjk
ttf-noto-nerd

fcitx5
fcitx5-configtool
fcitx5-mozc
fcitx5-qt
fcitx5-gtk

ghostty
chromium

wget
curl
unzip
zip
rsync
`

# AUR

`paru`

```bash
rustup default stable
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

# Config

`sudo vim /etc/modprobe.d/i915.conf`

```
options i915 enable_psr=0 enable_fbc=0 enable_dc=0
```

`sudo mkinit cpio -P`


`sudo vim /boot/loader/entries/yyyy-MM-dd_HH-mm-ss_linux.conf
`

```
options root=PARTUUID=aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee rw rootfstype=ext4 acpi_backlight=vendor
```

`sudo vim /etc/systemd/logind.conf
`

```
HandleSuspendKey=ignore
HandleLidSwitch=ignore
IdleAction=ignore
```

`vim $HOME/.xinitrc`

```
exec >>~/.xinitrc.log 2>&1
set -x
date

primary_out=""
for _ in 1 2 3 4 5 6 7 8 9 10; do
  primary_out="$(xrandr --query | awk '/ connected/{print $1; exit}')"
  [ -n "$primary_out" ] && break
  sleep 0.2
done

if [ -n "${primary_out:-}" ]; then
  xrandr --output "$primary_out" --rotate right || true
fi

xset s off
xset -dpms
xset s noblank
setxkbmap -option caps:none

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

fcitx5 &

exec i3
```
