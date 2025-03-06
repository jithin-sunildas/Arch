# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable Zsh completion
autoload -Uz compinit
compinit

export FUNCNEST=625

# Set Zsh prompt
PROMPT='%n@%m:%~%# '

# Enable syntax highlighting (if installed)
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Define colors
NEON_GREEN='%F{#39FF14}'
BLUE='%F{blue}'
WHITE='%F{white}'
cyan='%F{cyan}'
gray='%F{gray}'
darkgray='%F{darkgray}'
RED='%F{red}'             # Red color for username@hostname
BLUE='%F{blue}'           # Blue color for directory
RESET='%f'                # Reset color

# Customize prompt
#PROMPT='${RED}penguin@SuperDuperComputer ${BLUE}~${RESET}$ '
#PROMPT="${BLUE}penguin@SuperDuperComputer${RESET}${NEON_GREEN}%~% ${WHITE}$ "
#PROMPT='${NEON_GREEN}%n@%m ${BLUE}%~${RESET}$ '

# Alias examples
alias ll='lsd -la'
alias xampp='xhost +local: && sudo /opt/lampp/manager-linux-x64.run'
alias ls='lsd'
alias update='flatpak update'
alias god='sudo dnf'
alias cmyram='sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches'
alias give='flatpak install'
alias upgrade='flatpak upgrade'
alias nano='sudo -E nvim'
alias throw='flatpak remove'
alias mark='ollama run llama2-uncensored'
alias power_settings='nano /etc/systemd/logind.conf'
alias hyprland_settings='nano ~/.config/hypr/hyprland.conf'
alias waybar_settings='nano ~/.config/waybar/config'
alias neo='fastfetch'
alias w='cd /home/penguin/Work'
alias py='python3'
alias work='cd ~/Work && nano'
alias q='exit'
alias moff='pactl set-source-mute alsa_input.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__Mic2__source 1'
alias mon='pactl set-source-mute alsa_input.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__Mic2__source 0'
#alias mirror-u ='sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backupsudo rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup | sudo tee /etc/pacman.d/mirrorlist
#'
alias updatemirrors='sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup && sudo rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup | sudo tee /etc/pacman.d/mirrorlist'

# Key Bindings
bindkey '^[[1;5C' forward-word   # Ctrl + Right Arrow
bindkey '^[[1;5D' backward-word  # Ctrl + Left Arrow
bindkey -e   # Enables emacs key bindings
bindkey '^[[3~' delete-char  # Enables Delete key functionality
#bindkey '^H' backward-kill-word
#bindkey '^[[3;5~' kill-word
export WORDCHARS="*?_-.[]~=/"
bindkey '^[[1;5C' forward-word  # Ctrl+Right Arrow - Moves cursor by word
bindkey '^[[1;5D' backward-word  # Ctrl+Left Arrow - Moves cursor by word
bindkey '^H' backward-kill-word  # Ctrl+Backspace - Deletes a word backward
bindkey '^[[3;5~' delete-word  # Ctrl+Delete - Deletes a word forward


# Set the file where Zsh saves history
HISTFILE=~/.zsh_history
# Set the number of commands to save in history
HISTSIZE=10000
SAVEHIST=10000
# Save history after each command and across sessions
setopt APPEND_HISTORY      # Append history to HISTFILE, don't overwrite
setopt SHARE_HISTORY       # Share history between sessions
setopt INC_APPEND_HISTORY  # Append to history incrementally after each command
setopt HIST_IGNORE_DUPS    # Ignore duplicate entries in history

export PATH=$PATH:/home/penguin/.spicetify

plugins=(zsh-autosuggestions)
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/fzf/shell/key-bindings.zsh
source ~/anaconda3/etc/profile.d/conda.sh
#source $ZSH/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

source ~/.zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

HISTCONTROL=ignoreboth      # Prevents duplicate and space-prefixed commands from being saved
HISTSIZE=10000              # Sets the maximum number of commands to store in memory
SAVEHIST=10000              # Sets the maximum number of commands to save in the history file
HISTFILE=~/.zsh_history     # Sets the file where history is saved

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH=/opt/lampp/bin:$PATH

export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

if [ -e /home/penguin/.nix-profile/etc/profile.d/nix.sh ]; then . /home/penguin/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
export PATH=$PATH:$(go env GOPATH)/bin
