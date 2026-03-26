#!/bin/bash
MARKER_FILE="$HOME/main_setup/main.sh"

if [ -f "$MARKER_FILE" ]; then
    bash ~/main_setup/setup/Themes/themes.sh
else
    bash ~/main_setup/setup/setup.sh
    bash ~/main_setup/setup/Themes/themes.sh
fi
