# blinds.nvim emphasizes the current window

blinds.nvim emphasizes the current window by shading the non-active windows.

![Blinds animation](blinds.gif)

# Customization

Set variable `g:blinds_guibg` to the desired color in `init.vim`.

Example that will shade the other windows in grey:

    let g:blinds_guibg = "#969694"

# Requirements

neovim version 0.2 and above that supports the [`winhighlight`](https://neovim.io/doc/user/options.html#%27winhighlight%27) feature.
