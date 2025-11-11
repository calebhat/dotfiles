#!/bin/bash
if hyprctl clients -j | jq -e '
    .[] | select(.title == "DEV_NEOVIM" or .title == "DEV_TERM")
' > /dev/null; then
    exit 0                     # nothing to do – windows are already open
fi
# Launch Neovim terminal
~/.config/hypr/scripts/dev_neovim.sh &

# Poll until DEV_NEOVIM window appears (using JSON output for precision)
until hyprctl clients -j | jq -e '.[] | select(.title == "DEV_NEOVIM")' > /dev/null; do
    usleep 10000  # 10ms micro-sleep to avoid high CPU usage in the loop
done

# Preselect bottom for horizontal split
hyprctl dispatch layoutmsg preselect b

# Launch Ghostty terminal
~/.config/hypr/scripts/dev_term.sh & \

# Poll until DEV_GHOSTTY window appears
until hyprctl clients -j | jq -e '.[] | select(.title == "DEV_TERM")' > /dev/null; do
    usleep 10000
done

# Focus Neovim and expand downward
hyprctl dispatch focuswindow title:^DEV_NEOVIM$
hyprctl dispatch splitratio 0.25  # Adjust ratio as needed (e.g., 2 for 2:1, or exact 0.75 for 75%)
