# --- Detect primary output name ---
primary_out="$(xrandr --query | awk '/ connected primary/{print $1; exit}')"
if [ -z "${primary_out:-}" ]; then
  primary_out="$(xrandr --query | awk '/ connected/{print $1; exit}')"
fi

scale_xy="0.7x0.7"

xrandr --output "$primary_out" \
       --rotate right \
       --scale "${scale_xy}" \
       --filter nearest \
       --panning 1920x1200+0+0 || true

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx5

fcitx5 &

exec i3


