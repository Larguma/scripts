###########################################
# find what keybinds are used by Hyprland #
###########################################

# config:
#   change the 'mod_key' variable according to yours

modKey=mainMod # default for Hyprland

hyprlandConfig=$HOME/.config/hypr/hyprland.conf

grep "^bind" ${hyprlandConfig} \
  | rofi -dmenu 
