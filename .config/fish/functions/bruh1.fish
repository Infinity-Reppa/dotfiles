function bruh1 --wraps='sudo emaint sync -a && sudo emerge -auDNv @world && flatpak update' --description 'alias bruh1=sudo emaint sync -a && sudo emerge -auDNv @world && flatpak update'
    sudo emaint sync -a && sudo emerge -auDNv @world && flatpak update $argv
end
