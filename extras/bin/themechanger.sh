#!/bin/sh
function night() {
  cp $HOME/.config/nvim/lua/alternatives/gruvbox/init.lua $HOME/.config/nvim
  cp $HOME/.config/nvim/lua/alternatives/gruvbox/lualine.lua $HOME/.config/nvim/lua/plugins
}

function day() {
  cp $HOME/.config/nvim/lua/alternatives/kanagawa/init.lua $HOME/.config/nvim
  cp $HOME/.config/nvim/lua/alternatives/kanagawa/lualine.lua $HOME/.config/nvim/lua/plugins
}

while true
do
  if [[ `date +%H` -gt 17 || `date +%H` -lt 7 ]]
  then
    night
  else
    day
  fi
  sleep 3600 # 60 mins
done
