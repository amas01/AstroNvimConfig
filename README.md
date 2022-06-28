# AstroNvimConfig

My [AstroNvim](https://github.com/kabinspace/AstroVim) configuration

# Setup
Install and setup AstroNvim - https://astronvim.github.io/

Install black, flake8 and ipython:
```bash
pip install black flake8 ipython
```

Inside NeoVim install LSP:
```
:LspInstall pyright
```
```
:TSInstall python
```

Clone this repo and then create a symlink inside your NeoVim config:
```
ln -s ./user ~/.config/nvim/lua/user
```

Open NeoVim and sync plugins:
```
:PackerSync
```
