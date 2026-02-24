killall -9 pipewire wireplumber pipewire-pulse gentoo-pipewire-launcher 2>/dev/null
sleep 1
rm -rf ~/.local/state/wireplumber
/usr/bin/gentoo-pipewire-launcher &
