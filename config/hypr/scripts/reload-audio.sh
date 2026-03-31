killall pipewire wireplumber pipewire-pulse pulseaudio 2>/dev/null

sleep 1

if command -v gentoo-pipewire-launcher &> /dev/null; then
    gentoo-pipewire-launcher &
else
    pipewire &
    sleep 1
    wireplumber &
    pipewire-pulse &
fi

