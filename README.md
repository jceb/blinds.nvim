# blinds.nvim emphasizes the current window

blinds.nvim emphasizes the current window by shading the other windows.

# Customization

Just redefine the `Blinds` highlight group in init.vim with your preferred colors.

Example that will shade the other windows in grey:

    hi Blinds guibg=#969694

# Requirements

neovim version 0.2 and above that supports the `winhighlight` feature.
