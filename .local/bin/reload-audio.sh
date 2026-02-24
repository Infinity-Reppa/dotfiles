#!/bin/bash

# Mevcut ses süreçlerini sonlandır
killall pipewire wireplumber pipewire-pulse pulseaudio 2>/dev/null

# Süreçlerin tamamen kapanması için kısa bir süre bekle
sleep 1

# Gentoo PipeWire başlatıcısı varsa onu kullan, yoksa manuel başlat
if command -v gentoo-pipewire-launcher &> /dev/null; then
    gentoo-pipewire-launcher &
else
    pipewire &
    sleep 1
    wireplumber &
    pipewire-pulse &
fi

echo "Ses servisleri yeniden başlatıldı."
