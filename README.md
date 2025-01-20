
# some notes about installing neovim

### install node, npm via:

if needed, install node and npm:

    wget https://nodejs.org/dist/v16.20.2/node-v16.20.2-linux-x64.tar.gz
    tar zxvf node-v16.20.2-linux-x64.tar.gz
    export PATH=/home/wturner/pkgs/node-v16.20.2-linux-x64/bin:$PATH
  
and the pip things:

    pip3 install ruff
    pip3 install python-lsp-jsonrpc
    pip3 install python-lsp-server

and for some reason, mason was confused or partially installed, so do this:

    cp share/nvim_my_own_jan24/mason/packages/python-lsp-server/venv/lib/python3.9/site-packages/pylsp/plugins/rope_rename.py \
       share/nvim/mason/packages/python-lsp-server/venv/lib/python3.9/site-packages/pylsp/plugins/

### windows ATTEMPT (better notes now on ilc):

BUT will probably switch to Scoop/MSYS2/mingw (and give up on my beloved Cygwin)

    wget https://lua.org/ftp/lua-5.4.7.tar.gz
    tar zxvf lua-5.4.7.tar.gz
    cd lua-5.4.7
    make mingw
    make install INSTALL_TOP=/home/wendell/usr/local

    wget https://luarocks.org/releases/luarocks-3.11.1.tar.gz
    tar zxvf luarocks-3.11.1.tar.gz
    cd luarocks-3.11.1
    ./configure  --with-lua=/home/wendell/usr/local --prefix=/home/wendell/usr/local
    make
    make install

however:

    asus $ luarocks -h
    C:/cygwin64/home/wendell/usr/local/bin/lua.exe: error while loading shared libraries: lua54.dll:
    cannot open shared object file: No such file or directory

# OLD NOTES FOLLOW (mostly for old linux machines)

How I was able to get a recent NeoVIM (0.10) installed and operating with Telescope+grep.

## setup

use a decent gcc compiler:
```
    gcc --version
    gcc (GCC) 11.2.1 20220127 (Red Hat 11.2.1-9)
```

## compile nvim

see: [Install from source](https://github.com/neovim/neovim/blob/master/INSTALL.md#install-from-source)

note: using gcc11

cmake needed this:
```
    sudo apt install gettext
```

here goes:
```
    git clone https://github.com/neovim/neovim
    cd neovim
    make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim -DCMAKE_BUILD_TYPE=RelWithDebInfo"
    make install
```

## LazyVim prerequisites

check on all prereqs

make sure PATH is set:
~~~
  export PATH=/home/wendell/pkgs/node-v15.14.0-linux-x64/bin:$PATH
  export PATH=~/.cargo/bin:$PATH
  export PATH=~/neovim/bin:$PATH
~~~

neovim:
```
    $ ~/neovim/bin/nvim --version
    NVIM v0.10.0-dev-2128+g78b000c74
    Build type: RelWithDebInfo
    LuaJIT 2.1.1703358377
    Run "nvim -V1 -v" for more info
```

git:
```
    $ git --version
    git version 2.33.0.664.g0785eb7
```

lazygit:
```
    $ lazygit
    lazygit: command not found
```

not sure how to install cargo; it was copied from another installation:
```
    # copied from elsewhere just to get tree-sitter:
    . "$HOME/.cargo/env"

    $ cargo --version
    cargo 1.75.0 (1d8b05cdd 2023-11-20)
```

and/or possibly these:
```
    cargo install cargo-update
    cargo install --force cargo-strip
```
did this on cssi-ciws (may not be right):
```
    sudo apt install fdclone
```

ripgrep (a cargo thing):
```
    $ rg --version
    ripgrep 13.0.0
    -SIMD -AVX (compiled)
    +SIMD +AVX (runtime)
```

fd (a cargo thing):
```
    $ fd --version
    fd 8.6.0
```

node, npm:
```
    export PATH=/home/wendell/pkgs/node-v14.21.3-linux-x64/bin:$PATH
    $ node --version
    v14.21.3
    lazyvim $ npm --version
    6.14.18
```

npm packages:
```
    $ npm install -g neovim
    + neovim@4.10.1
    added 35 packages from 25 contributors in 3.537s
```

## get this repo

clone this repo:

~~~
    cd .config/
    mv nvim nvim_before_my_git
    git clone git@github.com:wendellwt/nvim.git
~~~


## startup

run NeoVIM and let it install items

```
    nvim
```

remaining warnings:

```
  :checkhealth

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

if you need to start over, just move all current items aside:

```
    cd ~/.config/       ; mv nvim nvim_bad

    cd ~/.local/share/  ; mv nvim nvim_bad
    cd ~/.local/state/  ; mv nvim nvim_bad
    cd ~/.cache/        ; mv nvim nvim_bad
```

## possible way to get pyright to behave

```
  pip3 uninstall pyright
```
and remove site-package files
```
  pip3 install pyright
```
make sure about the recent node/nvim

and turn off everything via config file:
```
vim pyright.json
  {
    typeCheckingMode = "off"
  }
```

consider adding these (from [Pyright Configuration](https://github.com/microsoft/pyright/blob/main/docs/configuration.md) ):

~~~
  analyzeUnannotatedFunctions  "false"
  strictParameterNoneValue     "false"
  enableTypeIgnoreComments     "false"

  reportMissingModuleSource    "none"
  reportInvalidTypeForm        "none"
  reportMissingImports         "none"
  reportUndefinedVariable      "none"
~~~

then, to test:
```
  pyright zip_route.py
```

Note: on cssi-ciws, it was very difficult to disable linters.
There were:
* flake8
* pyright
* pycodestyle
* pyflakes

Various source files were deleted in these dirs:
```
  ~/.local/share/nvim/mason/packages/python-lsp-server/venv/bin/
  ~/.local/share/nvim/mason/packages/python-lsp-server/venv/lib/python3.10/site-packages
```
YMMV.

## telescope

config file is `.config/nvim/lua/plugins/telescope-nvim.lua`

which has:
```
  options  = {
    previewer = true,
    grep_previewer = true,
  },
```
and:
```
  keys = {
      -- the one I was trying to get working all along:
      { "<leader>tg", builtin.grep_string, desc = "grep_string" },
  }
```

also, something like this is what others use:
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

see neovim/nvim_dev_env_keymaps.odt on piedmont


## pyproject.toml

```
#wt: argument-naming-style = "snake_case"
argument-naming-style = "any"

bad-names = [
    #wt: "foo",

good-names = [ # wt: "i",

disable = [
    # wt added:
    "redefined-outer-name",
    "trailing-newlines",
    "multiple-statements",
    ]

# wt: ignore-none = true
ignore-none = false

init-hook = 'import sys; sys.path.append("/home/wendell/.local/lib/python3.9/site-packages/"); '
```
