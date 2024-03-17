<div align='center'>

# chalktone.nvim

![chalktone_demo](/assets/chalktone_1.png)

###### mmmmmm warm and chalky

## Summary

A colorscheme for [neovim](https://neovim.io/) made with [lush.nvim](https://github.com/rktjmp/lush.nvim). New project, actively in development!

</div>

## Installation

Pick your plugin manager!


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
a Neovim highlight group (see `:h highlight-groups` and `:h group-name`). See `:h nvim_set_hl` for the fields and specifications that can be passed in.
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

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Nvim Treesitter configurations and abstraction layer
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) A completion plugin for neovim coded in lua
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim): A blazing fast and easy to configure neovim statusline plugin written in pure lua. 
- [nougat.nvim](https://github.com/MunifTanjim/nougat.nvim/tree/main): Hyperextensible Statusline / Tabline / Winbar for Neovim.
- [flash.nvim](https://github.com/folke/flash.nvim): Navigate your code with search labels, enhanced character motions and Treesitter integration.
- [which-key.nvim](https://github.com/folke/which-key.nvim): Create key bindings that stick. WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible keybindings of the command you started typing. 


## In Progress

- Finalizing colors
- Filling in remaining highlight groups (ex: treesitter markdown)
- Adding language specific touch-ups as needed
- Adding integrations for more plugins
- (...maybe) a *light* theme

## Shoutouts

- [lush.nvim](https://github.com/rktjmp/lush.nvim) (color generation tool)
- [nightfox.nvim](https://github.com/EdenEast/nightfox.nvim) (reference)
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) (plugin structure)
- [melange.nvim](https://github.com/savq/melange-nvim) (color inspiration)

