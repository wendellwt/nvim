# my own nvim config

## setup

use a decent gcc compiler:
```
    export PATH=/opt/rh/devtoolset-11/root/usr/bin/:$PATH
    gcc --version
    gcc (GCC) 11.2.1 20220127 (Red Hat 11.2.1-9)
```

## compile nvim

described elsewhere


## LazyVim prerequisites

check on all prereqs:
```
    $ ~/neovim/bin/nvim --version
    NVIM v0.10.0-dev-2128+g78b000c74
    Build type: RelWithDebInfo
    LuaJIT 2.1.1703358377
    Run "nvim -V1 -v" for more info
```

```
    $ git --version
    git version 2.33.0.664.g0785eb7
```

```
    $ lazygit
    lazygit: command not found
```

```
    $ rg --version
    ripgrep 13.0.0
    -SIMD -AVX (compiled)
    +SIMD +AVX (runtime)
```

```
    $ fd --version
    fd 8.6.0
```

```
    export PATH=/home/wendell/pkgs/node-v14.21.3-linux-x64/bin:$PATH
    $ node --version
    v14.21.3
    lazyvim $ npm --version
    6.14.18
```

```
    $ npm install -g neovim
    + neovim@4.10.1
    added 35 packages from 25 contributors in 3.537s
```

not sure how to install cargo; it was copied from another installation:
```
    # copied from elsewhere just to get tree-sitter:
    . "$HOME/.cargo/env"

    $ cargo --version
    cargo 1.75.0 (1d8b05cdd 2023-11-20)
```

## startup

remaining warnings:

```
  {flash.nvim}: unknown key <vscode>
  lazygit not installed
  No clipboard tool found.
  Perl is too old
  neovim-ruby-host not found
  conflicting keymap exists for mode **"n"**, lhs: **"gc"**
```


## Lazy package manager

[Installing NeoVim and Lazy (Package Manager)](https://medium.com/@shaikzahid0713/installing-neovim-and-packer-package-manager-for-neovim-30e166f8495a)

which just says to populate `lazy-config.lua` with the right config

## starting over

if you need to start over:

```
    cd ~/.config/       ; mv nvim nvim_bad

    cd ~/.local/share/  ; mv nvim nvim_bad
    cd ~/.local/state/  ; mv nvim nvim_bad
    cd ~/.cache/        ; mv nvim nvim_bad
```

## possible way to get pyright to behave

```
  pip3 uninstall pyright
  and remove site-package files
```

get recent node/nvim

and turn off everything via config file:
```
vim pyright.json
  {
    typeCheckingMode = "off"
  }
```

then, to test:

```
  pyright zip_route.py
```

## telescope

config file is `.config/nvim/lua/plugins/telescope-nvim.lua`

which has:
```
  options  = {
    previewer = true, -- wt
    grep_previewer = true, -- wt
  },
```
and:
```
  keys = {
      -- the one I was trying to get working all along:
      { "<leader>ff", builtin.grep_string, desc = "grep_string" },
  }
```

also, something like this should work:
```
  require('telescope.builtin').live_grep({
    search_dirs = { path },
    prompt_title = string.format('Grep in [%s]', vim.fs.basename(path)),
  })
```

refs:
<br/>
[Telescope live grep args](https://github.com/nvim-telescope/telescope-live-grep-args.nvim)
<br/>
[Telescope live_grep inside certain folders?](https://www.reddit.com/r/neovim/comments/xj784v/telescope_live_grep_inside_certain_folders/)


## nerdfonts on windows

refs:
<br/>
[Beautify your Windows Terminal using Nerd Fonts and Oh-My-Posh](https://medium.com/@vedantkadam541/beautify-your-windows-terminal-using-nerd-fonts-and-oh-my-posh-4f4393f097)

which says to:
```
  mkdir fira
  cd fira/
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/FiraCode.zip
  unzip FiraCode.zip
```

and then, in File Explorer:

```
    highlight all .ttf files
      -> Install
```

then, in PuTTY:

```
  -> Load
  -> Appearance
    FiraCode Nerd Font Mono
```

## keymaps:

~~~
    <> ee    :NvimTreeToggle      -- toggle file explorer
    <> er    :NvimTreeFocus       -- toggle focus to file explorer
    <> ef    :NvimTreeFindFile    -- find file in file explorer

    -- what we wanted to do all along:
    <> tf    builtin.grep_string   desc = "grep_string"
    <> tp    .find_files() end,    desc = "Find Plugin File"
    <> tb    :Telescope buffers
    <> tx    builtin.buffers
~~~

