#  Sigma Nvim
###### in lua
# This is a WIP

## Plugins
- packer.nvim
  * wbthomason/packer.nvim
- gruvbox-material
  * sainnhe/gruvbox-material
- nerdcommenter
  * preservim/nerdcommenter
- lualine.nvim
  * nvim-lualine/lualine.nvim
- presence.nvim (altough this is just for discord users)
  * andweeb/presence.nvim
- nvim-web-devicons
  * kyazdani42/nvim-web-devicons
- nvim-tree.lua
  * kyazdani42/nvim-tree.lua
- telescope.nvim
  * nvim-telescope/telescope.nvim
  * It requieres ```nvim-lua/plenary.nvim```
- nvim-autopairs
  * ```windwp/nvim-autopairs```

##  Important remaps
- ```leader key is the space bar```
- ```Control + h, j, k or l``` will serve as the movement keys for splits in normal mode.
- ```TAB``` will move you to the next tab.
- ```Shift + TAB``` will move you to the previous tab.
- ```Control + s``` will save your current buffer.
- ```Control + q``` will save and quit your vim sesion.
- ```Control + x``` will close the current buffer you are in but will not save your work.
- ```,,```          will bring a terminal at the bottom of the screen.
  * The terminal will be resized at just 20 for better screen space management.
  * This is usefull for C, C++ & Rust programing.
- ```leader + p```  will bring a BIG terminal window within the nvim instance.
  * This is usefull if you want to see most of the compilation errors/warnings more easily.
- ```Control + v``` will vertically split the window.
- ```Shift + h``` will horizontally split the window.
- ```Shift + k``` will bring a help menu in whatever happens you are positioned.

## TO-DO
[x] Have a clean codebase
[x] Optimize it
[ ] Make the REAME better xd
[ ] Lower start-up time to the minimum possible
[ ] Add a logo or something to it
