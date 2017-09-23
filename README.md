# blinds.nvim emphasizes the current window

blinds.nvim emphasizes the current window by shading the other windows.

![Blinds animation](blinds.gif)

# Customization

Just redefine the `Blinds` highlight group in your `init.vim` with the preferred colors.

Example that will shade the other windows in grey:

    hi Blinds guibg=#969694

# Requirements

neovim version 0.2 and above that supports the [`winhighlight`](https://neovim.io/doc/user/options.html#%27winhighlight%27) feature.
