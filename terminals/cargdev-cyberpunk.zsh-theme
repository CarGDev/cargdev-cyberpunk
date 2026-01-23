# CargDev Cyberpunk - Oh My Zsh Theme
#
# Installation:
# 1. Copy this file to ~/.oh-my-zsh/custom/themes/
# 2. Set ZSH_THEME="cargdev-cyberpunk" in your ~/.zshrc
# 3. Restart your terminal or run: source ~/.zshrc

# Color definitions using ANSI escape codes
# These work best with the CargDev Cyberpunk terminal color scheme applied

local cyan="%F{cyan}"
local magenta="%F{magenta}"
local green="%F{green}"
local yellow="%F{yellow}"
local blue="%F{blue}"
local red="%F{red}"
local white="%F{white}"
local reset="%f"

# Git info function
function git_prompt_info() {
    local ref
    ref=$(git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "${cyan}[${magenta}${ref#refs/heads/}$(parse_git_dirty)${cyan}]${reset}"
}

function parse_git_dirty() {
    local STATUS
    STATUS=$(git status --porcelain 2> /dev/null | tail -n1)
    if [[ -n $STATUS ]]; then
        echo "${yellow}*"
    else
        echo "${green}✓"
    fi
}

# Prompt configuration
PROMPT='
${cyan}╭─${magenta}%n${white}@${green}%m ${cyan}in ${yellow}%~${reset} $(git_prompt_info)
${cyan}╰─${green}❯${reset} '

RPROMPT='${cyan}[%*]${reset}'

# Enable colors
autoload -U colors && colors

# LS colors that match the theme
export LSCOLORS="gxfxcxdxbxegedabagacad"
export LS_COLORS="di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

# Colored man pages
export LESS_TERMCAP_mb=$'\e[1;35m'     # begin bold - magenta
export LESS_TERMCAP_md=$'\e[1;36m'     # begin blink - cyan
export LESS_TERMCAP_me=$'\e[0m'        # end mode
export LESS_TERMCAP_so=$'\e[1;33m'     # begin standout - yellow
export LESS_TERMCAP_se=$'\e[0m'        # end standout
export LESS_TERMCAP_us=$'\e[1;32m'     # begin underline - green
export LESS_TERMCAP_ue=$'\e[0m'        # end underline
