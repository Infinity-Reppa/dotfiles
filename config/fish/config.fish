fastfetch

set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
starship init fish | source

set -g fish_greeting

abbr -a bruh "sudo sh -c 'emaint sync -a && emerge -avuDN --with-bdeps=y @world && emerge @preserved-rebuild && emerge --depclean --ask && eclean-dist --deep && eclean-kernel && dispatch-conf'"
