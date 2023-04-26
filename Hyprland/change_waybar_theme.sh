#/bin/sh

##################################################
# script to change the waybar theme for Hyprland #
##################################################

# package nedded:
#   extra/zenity

# config:
#  put all your themes folders under '~/.config/waybar/themes'
#  ex: ~/.config/waybar/themes/theme1
#      ~/.config/waybar/themes/theme2
#
#  adding this to your hyprland.conf might be a good idea:
#    windowrulev2 = float,class:^(zenity)$

# usage:
#   bind this script to a key in Hyprland 
#   or make a custom module in the waybar config

for dir in $HOME/.config/waybar/themes/*/;
do
  buffer=$(basename "$dir")
  themes="${themes} ${buffer}"
done

userInput=$(zenity --list \
  --title="Choose your waybar theme" \
  --column="Theme folder" \
  $themes)

rm $HOME/.config/waybar/config.jsonc
rm $HOME/.config/waybar/style.css
ln $HOME/.config/waybar/themes/$userInput/config.jsonc $HOME/.config/waybar/config.jsonc
ln $HOME/.config/waybar/themes/$userInput/style.css $HOME/.config/waybar/style.css

pkill waybar

hyprctl dispatch exec waybar