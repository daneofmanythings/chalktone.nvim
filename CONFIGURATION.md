# Advanced Configuration

### intro

First, I will give a functional rundown on what highlight groups are. A highlight group is a key in
a table whos value is a table of data defining how that group will display in neo/vim. You can see all the
highlight groups currently defined for your setup with `:hi`. There are predefined groups that neovim 
will look for when it comes time to render the screen. You can read about the most relevant ones below
through the help docs. You don't need to read them right away, but they will be a good reference later.

- Editor: `:h highlight-groups`
- Syntax: `:h group-name`
- Treesitter: `:h treesitter-highlight`
- LSP: `:h lsp-highlight`


The configuration of chalktone works around one mechanism: Once the theme has been defined
in the call to `setup()` in [theme.lua](./lua/chalktone/theme.lua), the users options are forcefully 
merged into the setup theme table before it is used to set highlight groups through
`vim.api.nvim_set_hl()`. If you are unsure about how that function works, I reccommend 
reading `:h nvim_set_hl` for more details. 

These fields from the `opts` of `nvim_set_hl` are likely the most useful to your styling needs.

- `fg: color name (ex. 'red') or hex string (ex. '#ff0000')`
- `bg: color name (ex. 'red') or hex string (ex. '#ff0000')`
- `sp: color name (ex. 'red') or hex string (ex. '#ff0000')`
- `bold: boolean`
- `italic: boolean`
- `underline: boolean`
- `undercurl: boolean`
- `strikethrough: boolean`
- `link: name of another highlight group to link to. :h hi-link`

###### NOTE: link will override all other styling data and defer styling to the linked group


There is functionally no difference between the two main sections ('formatting' and 'format_by_group') 
of the config other than the convenience of setting large batches of groups with the same styling
(it also allows me to preconfigure some common use cases). You can see in the full config table below
that the 'builtin_transparent' section has quite a few highlight groups defined! 



#### The default configuration found in [config.lua](./lua/chalktone/config.lua):
```lua
options = {
    theme = 'default',
    palettet = {},
    formatting = {
        builtin_strings = {
            styling = { italic = true },
            groups = {
                'String',
                'Character',
                'Comment',
            },
        },
        builtin_bg_fading = {
            groups = {
                'NormalNC',
                'NormalFloatNC',
            },
        },
        builtin_transparent = {
            groups = {
                'Normal',
                'NormalNC',
                'NormalFloat',
                'NormalFloatNC',
                'SignColumn',
                'StatusLine',
                'StatusLineNC',
                'Pmenu',
                'WinSeparator',
                'VertSplit',
                'Folded',
                -- integrations
                'FlashBackdrop',
            },
        },
    },
    format_by_group = {
        -- Comment = { italic = false, },
        -- String = { italic = false, },
    },
}

```

Note that the names of the styling tables in 'formatting' (ex. 'builtin_strings') are do not have any
impact on the code other than for documentation purposes. Here is an example you could use to flashbang yourself:
```lua
...
formatting = {
    flashbang_myself = {
        styling = { bg = '#ffffff'},
        groups = { 
            'Normal',
            'NormalFloat',
            'NormalNC',
            'NormalFloatNC',
        },
    },
},
...
```

I do not reccommend doing this if you use a dark theme, but you can see the convenience of defining a single
styling for multiple groups!


#### Calling the [colors.lua](./lua/chalktone/colors.lua) api in your setup

There are available functions you can use to manipulate colors in your setup function. Here is the wiki
for [HSL](https://en.wikipedia.org/wiki/HSL_and_HSV) colorspace as a primer. Below is an example usage of
the blend and transform functions availble in the api.

```lua
...
config = function()
    local P = require('palettes') -- pulling in the palettes module that contains the color data
    local C = require('colors') -- pulling in the color module that contains color manipulation functions
    local palette = p.generate_default() -- generating the default colors for the default palette

    local blend = C.hex_blend_with_rgb -- a manipulation function that blends two hex colors by converting
                                       -- them to rgb, linearly blending, and converting back  

    local trans = C.hex_trans_with_hsl -- a manipulation function that can adjust the hue, saturation,
                                       -- or luminance of a hex value by converting a hex to the hsl
                                       -- colorspace, doing the ajustment, and converting it back to hex.
    require('chalktone').setup({
        formatting = {
            strings = {
                styling = { fg = trans(palette.strings, 0, 50, 0) }, -- increasing the saturation of the
                                                                     -- default string color by 50%
                groups = {
                    'String',
                    'Character',
                },
            },
        },
        format_by_group = {
            DiagnosticError = { bg = blend(palette.error_light, palette.bg_main, 0.85)} 
            -- adding a subtle background to diagnostic error messages                    
        }
    })
end
```

A note about the hsl transformation function: It handles hue, saturation, and luminance manipulation
at once. It will ignore arguements left as 0. Hue is manipulated as an absolute rotation,
where saturation and luminance are manipulated as relative through a lerp function. As 
an example, transforming a color with 10% saturation by 50% will be a larger jump than
transforming a color with saturation of 90% by 50% (they will end at 55% and 95% saturation respectively)

The signatures of manipulation functions and specific names for the color data can be found
in their respective modules. This would be a good time to go back and read through 
highlight group help pages to find which groups you may want to modify. A large 
portion of [theme.lua](./lua/chalktone/theme.lua) is commented as to what each group controls.
You may find it useful as a reference.

#### Substituting a custom palette in your setup

This plugin does not use many 'links' when setting its highlighting. This is to give the users
more freedom to customize their colors. However, this comes at a cost. Changing the color that
, for example, 'Function' is associated with, will not change all groups that use the color 
'Function' does. You may want to easily implement this without listing out all highlight groups
that use that color. This can be done by substituting a custom palette into the config. Here
is an example of changing the color 'func' in the palette so all groups that use that color are
changed.

```lua
config = function()
    local P = require('chalktone.palettes')
    local palette = P.generate_default()
    local palette.func = '#ff0000'
    require('chalktone').setup({
        theme = 'default',
        palette = palette,
    })
end
```

The names of the recognized colors in a palette table can be seen in [palettes.lua](./lua/chalktone/palettes.lua).
You can submit any table with the schema { name = 'hexvalue' }. Any required names that aren't
present in the supplied table will be gotten from the palette indicated in 'theme' field of the
setup. In the above case, that is 'default'. If theme isn't specified, 'default' is selected.
