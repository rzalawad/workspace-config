#!/bin/zsh

if [ -z ${OPT_HOME+x} ];
then
    mkdir -p ~/opt/
    OPT_HOME=~/opt/
fi

echo "OPT_HOME: $OPT_HOME"

ARCH=$(uname -m)
if [[ $ARCH == "x86_64" ]];
then
    NODE_ARCH='x64'
    NEOVIM_ARCH='linux64'
else
    NODE_ARCH='arm64'
    NEOVIM_ARCH='macos'
fi
echo "System arch: $ARCH & Node arch: $NODE_ARCH"

# download NODEJS
NODE_JS_VERSION=$(curl -s https://nodejs.org/dist/latest/ \
    | grep -o 'href=".*">' \
    | sed 's/href="//;s/\/">//' \
    | sed 's/">//' \
    | grep -E 'node.*.tar.gz' \
    | grep $(uname -s | awk '{print tolower($0)}') \
    | grep $NODE_ARCH)
echo "Downloading https://nodejs.org/dist/$NODE_JS_VERSION"
NODE_JS_DIRNAME="$(echo $NODE_JS_VERSION | cut -f -3 -d '.')"
echo $NODE_JS_DIRNAME
curl -s https://nodejs.org/dist/latest/$NODE_JS_VERSION -o $OPT_HOME/nodejs.tar.gz
tar xvf $OPT_HOME/nodejs.tar.gz -C $OPT_HOME/
rm -rf $OPT_HOME/nodejs
mv $OPT_HOME/$NODE_JS_DIRNAME $OPT_HOME/nodejs
rm $OPT_HOME/nodejs.tar.gz

# download NEOVIM binaries
curl -sSL https://github.com/neovim/neovim/releases/download/nightly/nvim-$NEOVIM_ARCH.tar.gz -o $OPT_HOME/neovim.tar.gz
mkdir -p mydir
tar xvf $OPT_HOME/neovim.tar.gz -C $OPT_HOME
mv $OPT_HOME/nvim-$NEOVIM_ARCH $OPT_HOME/nvim

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
