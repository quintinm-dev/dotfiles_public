#!/bin/bash

# Fetches settings, writing to both stdout and gnome_config.txt

fetch_settings() {
    # My choices of path depth are somewhat arbitrary
    declare -a paths=(
                    "/org/gnome/settings-daemon/plugins/"
                    "/org/gnome/desktop/wm/"
                    "/org/gnome/shell/extensions/"
                    "/org/gnome/shell/keybindings/"
                    "/org/gnome/shell/window-switcher/"
                    "/org/gnome/mutter/"
                    )

    for path in "${paths[@]}"
    do
        echo -e "$path"
        echo -e "---------------------------------------------------"
        # use dconf dump over gsettings as it only shows modified from defaults
        echo -e "$(dconf dump "${path}")"
        echo -e
    done
}

fetch_settings | tee gnome_config.txt
