#!/bin/bash
num="$(cat ~/.config/hypr/scripts/toggle_pannel)"
echo "AAA $num" > ~/.config/hypr/scripts/test

if [ $num == "B" ];
then
  echo "A" > ~/.config/hypr/scripts/toggle_pannel
  hyprpanel -q

else 
  echo "B" > ~/.config/hypr/scripts/toggle_pannel
  hyprpanel
fi


