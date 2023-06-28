### GREETING ###
set -U fish_greeting
neofetch

### VI MODE ###
function fish_user_key_bindings
  fish_vi_key_bindings
end

### ALIASES ###

# confirm before overwriting
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# exa
alias ls="exa -a --long --header --git"

# pacman
alias pacsyu='sudo pacman -Syu'		# update only standard pkgs
alias pacr='sudo pacman -R'		# remove only standard pkgs
alias pacq='sudo pacman -Q'		# list only standard pkgs
alias pacsc='sudo pacman -Sc'		# Refresh pkglist & update standard pkgs
alias yaysua='yay -Sua --noconfirm'	# update only yay pkgs
alias yaysyu='yay -Syu --noconfirm'	# update standard pkgs and yay pkgs

# yl-dlp
alias yta-best="yt-dlp --extract-audio --audio-format best"
alias yta-flac="yt-dlp --extract-audio --audio-format flac"
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3"
alias ytv-mp4="yt-dlp -f mp4"
alias ytv-best="yt-dlp -f bestvideo+bestaudio"

### PROMPT ###
starship init fish | source
