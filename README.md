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
    require('chalktone').setup()
    vim.g.colorscheme('chalktone')
end
```
</details>


## Setup

The basic setup structure:
```lua
require('chalktone').setup({
    theme = 'default', -- This is currently the only theme
    formatting = {
        -- Apply stylings to multiple highlight groups at once.
    },
    format_by_group = {
        -- Apply stylings to a single group at a time. 
        -- Overwites stylings from formatting. 
    },
})
```

This plugin exposes neovims highlighting api `:h nvim_set_hl` under 'formatting' and 'format_by_group'.
A more detailed examination can be found in [CONFIGURATION](./CONFIGURTION.md). Below are some convenience formatting
setups to aid in common alterations

<details>
<summary>no italics</summary>

```lua
...
    formatting = {
        builtin_strings = {
            styling = { italic = false },
        },
    },
...

```
</details>

<details>
<summary>transparent background</summary>

```lua
...
    formatting = {
        builtin_transparent = {
            styling = { bg = 'None' },
        },
    },
...
```
</details>

<details>
<summary>no background fading</summary>

```lua
...
    formatting = {
        builtin_bg_fading = {
            styling = { link = 'Normal' },
        },
    },
...
```

</details>

## Integrations

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Nvim Treesitter configurations and abstraction layer.
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp): A completion plugin for neovim coded in lua.
- [neorg](https://github.com/nvim-neorg/neorg/tree/main): Modernity meets insane extensibility. The future of organizing your life in Neovim.
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim): A blazing fast and easy to configure neovim statusline plugin written in pure lua.
- [nougat.nvim](https://github.com/MunifTanjim/nougat.nvim/tree/main): Hyperextensible Statusline / Tabline / Winbar for Neovim.
- [flash.nvim](https://github.com/folke/flash.nvim): Navigate your code with search labels, enhanced character motions and Treesitter integration.
- [which-key.nvim](https://github.com/folke/which-key.nvim): Create key bindings that stick. WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible keybindings of the command you started typing.
- [lazy.nvim](https://github.com/folke/lazy.nvim): A modern plugin manager for Neovim.

## Extras

- [alacritty](https://github.com/alacritty/alacritty): A cross-platform, OpenGL terminal emulator.


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

