OPT_HOME ?= ~/opt

ARCH := $(shell uname -m)
OS := $(shell uname -s)

ifeq ($(ARCH), x86_64)
    NODE_ARCH := x64
    NEOVIM_ARCH := linux64
else
    NODE_ARCH := arm64
    NEOVIM_ARCH := macos-arm64
endif


setup:
	@echo OPT_HOME: $(OPT_HOME)
	@echo System arch: $(ARCH) and Node arch: $(NODE_ARCH)
	@mkdir -p $(OPT_HOME)

fzf: setup
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install

neovim: setup
	curl -sSL https://github.com/neovim/neovim/releases/download/stable/nvim-$(NEOVIM_ARCH).tar.gz -o $(OPT_HOME)/neovim.tar.gz
	tar xvf $(OPT_HOME)/neovim.tar.gz -C $(OPT_HOME)
	rm -rf $(OPT_HOME)/nvim
	mv $(OPT_HOME)/nvim-$(NEOVIM_ARCH) $(OPT_HOME)/nvim
	$(MAKE) vimplug
	echo "alias nvim=~/opt/nvim/bin/nvim" >> ~/.zshrc
	echo "alias nvim=~/opt/nvim/bin/nvim" >> ~/.bashrc

rust: setup
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o $(OPT_HOME)/rust-init.sh \
		&& chmod +x $(OPT_HOME)/rust-init.sh \
		&& $(OPT_HOME)/rust-init.sh -y --profile default
	rm $(OPT_HOME)/rust-init.sh
ifeq ($(OS), Darwin)
	brew install rust-analyzer
endif

brew: setup
ifeq ($(OS), Darwin)
	curl -fsSL "https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh" -o $(OPT_HOME)/brew_install.sh
	bash $(OPT_HOME)/brew_install.sh
	rm $(OPT_HOME)/brew_install.sh
endif

compiler: setup
ifeq ($(OS), Darwin)
	brew install gcc
endif

build_system: setup
ifeq ($(OS), Darwin)
	brew install meson ninja bison cmake
else
	sudo apt install build-essential
	sudo apt install meson ninja-build bison cmake
endif
	python3 -m pip install Mako


starship:
ifeq ($(OS), Darwin)
	brew install starship
endif

nodejs: setup
	$(eval NODE_JS_VERSION := $(shell curl -s https://nodejs.org/dist/latest/ | grep -o 'href=".*">' \
		| sed 's/href="//;s/\/">//' \
		| sed 's/">//' \
		| grep -E 'node.*.tar.gz' \
		| grep $(shell uname -s | awk '{print tolower($0)}') \
		| grep $(NODE_ARCH)))

	@echo Downloading https://nodejs.org/dist/$(NODE_JS_VERSION)
	$(eval NODE_JS_DIRNAME:="$(shell echo $(NODE_JS_VERSION) | cut -f -3 -d '.')")
	@echo Node dir $(NODE_JS_DIRNAME)
	curl -s https://nodejs.org/dist/latest/$(NODE_JS_VERSION) -o $(OPT_HOME)/nodejs.tar.gz
	tar xvf $(OPT_HOME)/nodejs.tar.gz -C $(OPT_HOME)/
	rm -rf $(OPT_HOME)/nodejs
	mv $(OPT_HOME)/$(NODE_JS_DIRNAME) $(OPT_HOME)/nodejs
	rm $(OPT_HOME)/nodejs.tar.gz

vimplug:
	@bash -c 'curl -fLo "$${XDG_DATA_HOME:-$$(eval echo ~$${USER})/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

all: setup fzf neovim rust brew compiler vimplug nodejs

.PHONY: setup fzf neovim rust brew compiler nodejs build_system all
.DEFAULT_GOAL := setup
