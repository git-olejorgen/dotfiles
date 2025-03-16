##These are my dotfiles 

Files are syncronized with symlinks - remember to setup new files;
# hyprland conf
ln -sf ~/.dotfiles/hypr/hyprland.conf ~/.config/hypr/hyprland.conf
# hyprpaper conf (wallpaper)
ln -sf ~/.dotfiles/hypr/hyprpaper.conf ~/.config/hypr/hyprpaper.conf

# wofi (application launcher)
ln -sf ~/.dotfiles/wofi/config ~/.config/wofi/config
ln -sf ~/.dotfiles/wofi/style.css ~/.config/wofi/style.css

# kitty (terminal)
ln -sf ~/.dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf

# NVIM
ln -sf ~/.dotfiles/nvim ~/.config/nvim


## Symlinks and CDPATH

# This makes it so all subdirs of personal is CD'able from anywheere, just CD Unheard 
export CDPATH=.:$HOME:$HOME/Documents/CS/Projects/personal
