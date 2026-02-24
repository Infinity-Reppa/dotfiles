# Eğer zaten çalışıyorsa tekrar başlatma (Çakışmayı önler)
if pgrep -x "pipewire" > /dev/null; then
    echo "Pipewire zaten çalışıyor."
    exit 0
fi

# Ses sunucusu (Core)
/usr/bin/pipewire &

# Biraz bekle (Core'un kendine gelmesi için - OpenRC'de hayat kurtarır)
sleep 1

# PulseAudio Uyumluluğu
/usr/bin/pipewire-pulse &

# Oturum Yöneticisi (Bu olmadan ses kartı görünmez)
/usr/bin/wireplumber &
