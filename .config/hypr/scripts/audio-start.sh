#!/bin/sh
# Askıda kalan tüm eski ses süreçlerini zorla sonlandır
killall -9 pipewire wireplumber pipewire-pulse gentoo-pipewire-launcher 2>/dev/null
sleep 1
# Uyumsuz kalmış olabilecek WirePlumber durum dosyasını temizle
rm -rf ~/.local/state/wireplumber
# Gentoo'nun sağladığı yapılandırılmış betiği çalıştır
/usr/bin/gentoo-pipewire-launcher &
