#!/bin/bash

DIR="/home/yigit/.config/hypr/swww_wallpapers"
STATE_FILE="/tmp/swww_index"
INTERVAL=300

# Dosyaları listele
files=( "$DIR"/* )
total=${#files[@]}

# İndeksi oku veya oluştur
get_index() {
    if [ -f "$STATE_FILE" ]; then
        cat "$STATE_FILE"
    else
        echo 0
    fi
}

apply_wallpaper() {
    local idx=$1
    swww img "${files[$idx]}" --transition-type random --transition-step 90 --transition-fps 60
    echo "$idx" > "$STATE_FILE"
}

case "$1" in
    "next")
        curr=$(get_index)
        next=$(( (curr + 1) % total ))
        apply_wallpaper $next
        ;;
    "prev")
        curr=$(get_index)
        prev=$(( (curr - 1 + total) % total ))
        apply_wallpaper $prev
        ;;
    "daemon")
        # Eski döngünüzün yerini alır
        while true; do
            # Rastgele bir sonrakine geç (Shuffle mantığı)
            new_idx=$(( RANDOM % total ))
            apply_wallpaper $new_idx
            sleep $INTERVAL
        done
        ;;
    *)
        # İlk açılışta rastgele bir tane ayarla
        apply_wallpaper $(( RANDOM % total ))
        ;;
esac
