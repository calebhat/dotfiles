#!/bin/bash
TARGET_DIR="$HOME/elixir/shophawk"

ghostty --title=DEV_NEOVIM -e bash -c "
  cd '$TARGET_DIR' && exec nvim \"\$@\";
" "$@"
