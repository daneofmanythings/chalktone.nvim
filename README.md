<div align='center'>

# chalktone.nvim

![chalktone_demo](/assets/chalktone_demo.gif)

###### mmmmmm warm and chalky

## Summary

A colorscheme for [neovim](https://neovim.io/). New project, actively in development!

</div>

## Installation

Installation with your favorite plugin manager:

-
    <details>
    <summary><a href='https://github.com/folke/lazy.nvim'>lazy.nvim</a></summary>

    ```lua
    'daneofmanythings/chalktone.nvim',
    priority = 1000,
    lazy = false,
    config = function()
        require('chalktone').setup({})
        vim.g.colorscheme('chalktone')
    end
    ```
    </details>


## Setup

```lua
require('chalktone').setup({
    -- defaults
    palette_name = 'default',
    formatting = {
        Comment = {
            italic = true,
        },
        String = {
            italic = true,
        },
    },
})
```

There are currently no supported aggregate configuration options availible. 
Under formatting, you may specifiy options to be passed to `vim.api.nvim_set_hl` for
a Neovim highlight group (see `:h highlight-groups`). See `:h nvim_set_hl` for the fields and specifications that can be passed in.
The options are restricted to `fg, bg, sp, bold, underline, undercurl, strikethrough, italic, link`.
An example to change the highlight group 'Comment':
```lua
...
    Comment = {
        fg = '#ffffff',
        italic = false,
        bold = true,
    },
...
```

## Integrations

- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim): A blazing fast and easy to configure neovim statusline plugin written in pure lua. 
- [flash.nvim](https://github.com/folke/flash.nvim): Navigate your code with search labels, enhanced character motions and Treesitter integration.

## In Progress

- Finalizing colors
- Filling in remaining highlight groups (ex: treesitter markdown)
- Adding integrations for more plugins
- (...maybe) a *light* theme

## Shoutouts

- [nightfox.nvim](https://github.com/EdenEast/nightfox.nvim)
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
- [melange.nvim](https://github.com/savq/melange-nvim)

