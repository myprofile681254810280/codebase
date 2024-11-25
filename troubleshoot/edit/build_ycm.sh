#c家族
#sudo pacman -S clang

ROOT=~/del/ycm_build
mkdir $ROOT -p
cd $ROOT

#config
cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp -DUSE_SYSTEM_LIBCLANG=ON #-DUSE_PYTHON2=OFF
#compile
cmake --build . --target ycm_core 
#--config Release

###################################################javascript
#yaourt -S nodejs-tern
cd ~/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/tern_runtime
npm install --production
#js可用命令 RefactorRename 
#js相关的配置参看tern-config

###################################################3#rust
cd ~/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/racerd
cargo build --release

#ycm可以整合eclim


#cd ~/.vim/bundle/YouCompleteMe
#./install.py #--clang-completer

