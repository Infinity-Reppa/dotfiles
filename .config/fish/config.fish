fastfetch
starship init fish | source
set -g fish_greeting

function mkcd
    mkdir -p $argv; and cd $argv
end
