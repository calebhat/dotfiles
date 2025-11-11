#!/bin/bash
TARGET_DIR="$HOME/elixir/shophawk"

ghostty --title=DEV_TERM -e bash -c "
  cd '$TARGET_DIR' && mix phx.server; exec \"\$SHELL\";
"
