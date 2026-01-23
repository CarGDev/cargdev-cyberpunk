#!/bin/bash
# CargDev Cyberpunk - Shell Color Configuration
#
# This script configures terminal colors for bash/zsh.
# Source this file in your .bashrc or .zshrc:
#   source /path/to/cargdev-cyberpunk-shell.sh
#
# Note: For best results, also apply the terminal theme
# (iTerm2, Alacritty, Kitty, etc.) that matches this colorscheme.

# Terminal escape sequences for 256-color/true-color terminals
# These set the actual terminal palette colors (if supported)

if [[ "$TERM" == *"256color"* ]] || [[ "$COLORTERM" == "truecolor" ]] || [[ "$COLORTERM" == "24bit" ]]; then
    # Set terminal palette using OSC escape sequences
    # Color 0-7: Normal colors
    printf '\e]4;0;#002B36\e\\'   # Black
    printf '\e]4;1;#FF5555\e\\'   # Red
    printf '\e]4;2;#50FA7B\e\\'   # Green
    printf '\e]4;3;#FFB86C\e\\'   # Yellow
    printf '\e]4;4;#BD93F9\e\\'   # Blue
    printf '\e]4;5;#FF79C6\e\\'   # Magenta
    printf '\e]4;6;#8BE9FD\e\\'   # Cyan
    printf '\e]4;7;#E0E0E0\e\\'   # White

    # Color 8-15: Bright colors
    printf '\e]4;8;#44475A\e\\'   # Bright Black
    printf '\e]4;9;#FF6E67\e\\'   # Bright Red
    printf '\e]4;10;#5AF78E\e\\'  # Bright Green
    printf '\e]4;11;#F4F99D\e\\'  # Bright Yellow
    printf '\e]4;12;#CAA9FA\e\\'  # Bright Blue
    printf '\e]4;13;#FF92DF\e\\'  # Bright Magenta
    printf '\e]4;14;#9AEDFE\e\\'  # Bright Cyan
    printf '\e]4;15;#F8F8F2\e\\'  # Bright White

    # Set background and foreground
    printf '\e]10;#E0E0E0\e\\'    # Foreground
    printf '\e]11;#002B36\e\\'    # Background
    printf '\e]12;#8BE9FD\e\\'    # Cursor
fi

# LS_COLORS for colorized directory listings
export LS_COLORS="di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

# BSD ls colors (macOS)
export LSCOLORS="gxfxcxdxbxegedabagacad"

# Enable color support
export CLICOLOR=1

# Grep colors
export GREP_COLORS="ms=01;35:mc=01;35:sl=:cx=:fn=36:ln=33:bn=32:se=36"

# GCC colors
export GCC_COLORS="error=01;31:warning=01;33:note=01;36:caret=01;32:locus=01:quote=01"

# Less/Man page colors
export LESS_TERMCAP_mb=$'\e[1;35m'     # begin bold - magenta
export LESS_TERMCAP_md=$'\e[1;36m'     # begin blink - cyan (for headings)
export LESS_TERMCAP_me=$'\e[0m'        # end mode
export LESS_TERMCAP_so=$'\e[1;33m'     # begin standout - yellow (status line)
export LESS_TERMCAP_se=$'\e[0m'        # end standout
export LESS_TERMCAP_us=$'\e[1;32m'     # begin underline - green
export LESS_TERMCAP_ue=$'\e[0m'        # end underline

# FZF colors (if fzf is installed)
export FZF_DEFAULT_OPTS="
  --color=fg:#E0E0E0,bg:#002B36,hl:#FF79C6
  --color=fg+:#F8F8F2,bg+:#44475A,hl+:#FF79C6
  --color=info:#8BE9FD,prompt:#50FA7B,pointer:#FF79C6
  --color=marker:#50FA7B,spinner:#FF79C6,header:#BD93F9
"

# BAT theme (if bat is installed)
export BAT_THEME="Dracula"

echo "CargDev Cyberpunk colors loaded!"
