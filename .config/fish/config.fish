fastfetch
starship init fish | source
set -g fish_greeting

if status is-interactive
    # -------------------------------------------------------------------------
    # 1. GENTOO & PORTAGE KISAYOLLARI (ABBREVIATIONS)
    # -------------------------------------------------------------------------
    # Bu kısaltmalar yazıldığında otomatik olarak uzun komuta genişler.
    
    # Sistem Güncelleme (Sync + World Update + Flatpak + Temizlik)
    abbr --add bruh "sudo emaint sync -a && sudo emerge -auDNv @world && flatpak update && sudo emerge -ac && sudo eclean-dist -d"
    
    # Paket Kurulum (Ask & Verbose)
    abbr --add inst "sudo emerge --ask --verbose"
    
    # Paket Kaldırma (Depclean - Gereksiz bağımlılıklarla birlikte)
    abbr --add uninst "sudo emerge --ask --depclean"
    
    # Paket Arama
    abbr --add search "emerge --search"
    
    # Gereksiz Paketleri Temizle (Orphaned)
    abbr --add clean "sudo emerge --depclean"

    # Kernel Derleme Sonrası (Grub & Modules)
    abbr --add kernelupdate "sudo make modules_install && sudo make install && sudo grub-mkconfig -o /boot/grub/grub.cfg"

    # -------------------------------------------------------------------------
    # 2. OYUN VE GRAFİK OPTİMİZASYONU (AMD RDNA & HDR)
    # -------------------------------------------------------------------------
    # Her oyun için ayrı ayrı parametre girmek yerine global tanımlar.
    
    # Sürücü Tercihi: Mesa RADV (AMDVLK yerine)
    set -gx AMD_VULKAN_ICD radv
    
    # Ray Tracing (Işın İzleme) Performans Ayarı
    set -gx RADV_PERFTEST gpl
    
    # HDR Aktivasyonu (Tüm DX12/Vulkan oyunları için)
    set -gx DXVK_HDR 1
    set -gx ENABLE_HDR_WSI 1
    
    # Proton/Wine için AMD GPU Hizmetleri
    set -gx PROTON_ENABLE_AMD_AGS 1
    
    # Doom Eternal vb. oyunlar için Ses Gecikme Ayarı (Global Fix)
    set -gx PULSE_LATENCY_MSEC 60

    # -------------------------------------------------------------------------
    # 3. GENEL SİSTEM AYARLARI
    # -------------------------------------------------------------------------
    
    # Varsayılan Editör
    set -gx EDITOR nano
    set -gx VISUAL nano

    # Renkli Çıktılar (Grep ve LS)
    alias grep "grep --color=auto"
    alias ls "ls --color=auto"
    alias ll "ls -lvh"
    alias la "ls -lavh"

    # Güvenli Dosya İşlemleri (Onay ister)
    alias cp "cp -i"
    alias mv "mv -i"
    alias rm "rm -i"

    # -------------------------------------------------------------------------
    # 4. PATH VE GÖRÜNÜM
    # -------------------------------------------------------------------------
    
    # Yerel binary yolları
    fish_add_path ~/.local/bin
    fish_add_path ~/.cargo/bin

    # Fish Karşılama Mesajını Kapat (Daha temiz terminal)
    set -U fish_greeting ""
end

# -------------------------------------------------------------------------
# 5. ÖZEL FONKSİYONLAR
# -------------------------------------------------------------------------

# Hızlı Dizin Oluşturma ve Girme
function mkcd
    mkdir -p $argv; and cd $argv
end
