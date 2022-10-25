# A Minimal Neovim Configuration

## Requirements

Latest Neovim v0.8.0 recommended.


## Installation

You might want to make a backup of your existing config first
```
mv ~/.config/nvim ~/.config/nvim.old
```

### Linux/macOS
```
git clone -b transparent https://github.com/diwasrimal/Neovim.git ~/.config/nvim
```

### Windows
```
git clone -b transparent https://github.com/diwasrimal/Neovim.git C:\Users\Administrator\AppData\Local\nvim
```
Once cloning the repository, open `nvim` and run `:PackerSync`. This will install
all your required plugins. Run `:checkhealth` to conduct a health check.


## Configuration tree
```
.
├── init.lua
├── lua
│   └── user
├── plugin
│   └── packer_compiled.lua
└── README.md
```

## Plugin Information
```
.
└── lua
    └── user
        ├── autocmds.lua      : Autocommands executed for certain filetypes
        ├── catppuccin.lua    : Colorscheme
        ├── cmp.lua           : Autocompletion handler (gives popup menu)
        ├── comment.lua       : Faster commenting
        ├── gruvbox.lua       : Colorscheme
        ├── keymaps.lua       : Keybindings
        ├── lsp                
        │   ├── init.lua      : Server configs
        │   └── visuals.lua   : Visual effects for LSP
        ├── mason.lua         : LSP, linters, Debbuger installer
        ├── options.lua       : Settings
        └─ plugins.lua       : List of plugins used
 ```
