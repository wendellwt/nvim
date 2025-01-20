
# my notes

### yellow: install node, nvim via:

    wget https://nodejs.org/dist/v16.20.2/node-v16.20.2-linux-x64.tar.gz
    tar zxvf node-v16.20.2-linux-x64.tar.gz
    export PATH=/home/wturner/pkgs/node-v16.20.2-linux-x64/bin:$PATH
  
### $ pip3 install:

     ruff
     python-lsp-jsonrpc
     python-lsp-server

    cp share/nvim_my_own_jan24/mason/packages/python-lsp-server/venv/lib/python3.9/site-packages/pylsp/plugins/rope_rename.py \
       share/nvim/mason/packages/python-lsp-server/venv/lib/python3.9/site-packages/pylsp/plugins/

### windows ATTEMPT (better notes now on ilc):

BUT will probably switch to Scoop/MSYS2/mingw

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

### however:

    asus $ luarocks -h
    C:/cygwin64/home/wendell/usr/local/bin/lua.exe: error while loading shared libraries: lua54.dll:
    cannot open shared object file: No such file or directory


