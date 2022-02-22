PREFIX?=/usr/local
HOMEBREW_URL?=https://raw.githubusercontent.com/Homebrew/install/master/install

generated = Brewfile Brewfile.lock.json chezmoi

.EXPORT_ALL_VARIABLES:	

.PHONY: help
help:
	@echo 'Management commands for dotfiles:'
	@echo
	@echo 'Usage:'
	@echo '    make init       Initialize chezmoi.'
	@echo '    make install      Apply chezmoi files (runs all scripts).'
	@echo '    make post-chezmoi       Run post chezmoi scripts.'
	@echo '    make install-homebrew   Install Homebrew.'
	@echo '    make install-chezmoi    Install chezmoi.'
	@echo
	@echo '    Logs are stored in      $(LOGFILE)'

.PHONY: clean
clean:
	# -rm $(generated)
	-brew bundle cleanup

.PHONY: force-clean
force-clean: clean
	-chezmoi purge

install: chezmoi Brewfile homebrew
	brew bundle

chezmoi: homebrew
	@echo "Installing chezmoi.."
	brew install chezmoi

homebrew:
	@echo "Installing homebrew.."
	if [ ! "$(command -v brew)" ]; then \
		NONINTERACTIVE=1 /bin/sh -c "$(curl -fsSL $HOMEBREW_URL)" ; \
	fi

Brewfile: homebrew
	@echo "Generating fresh brewfile..."
	brew bundle dump -f

Brewfile.lock.json: Brewfile

# ensure-deps:
# 	@echo "Ensuring dependencies.."
# 	$(MAKE) install-homebrew
# 	$(MAKE) install-chezmoi
# 	$(MAKE) install-deps
# 	$(MAKE) install-aur
# 	$(MAKE) install-go-deps

.PHONY: test
test: chezmoi homebrew Brewfile
	@echo "Running tests"
	chezmoi verify 
	chezmoi doctor
	brew bundle check 


.PHONY: apply
apply: chezmoi homebrew Brewfile
	@echo "Applying chezmoi.."
	chezmoi apply -v 

.PHONY: info
info:
	-brew config
	chezmoi

# all:
# 	$(MAKE) ensure-deps
# 	$(MAKE) start-services
# 	$(MAKE) git-repos
# 	$(MAKE) conf-sys
# 	$(MAKE) ssh-perms
# 	$(MAKE) gnupg-perms
# 	$(MAKE) chezmoi-init
# 	$(MAKE) osx-defaults
# 	$(MAKE) ensure-dirs
# 	$(MAKE) chezmoi-apply

# run:
# 	$(MAKE) ensure-deps 
# 	$(MAKE) chezmoi-init 
# 	$(MAKE) chezmoi-apply

# post-chezmoi:
# 	$(MAKE) start-services
# 	$(MAKE) git-repos
# 	$(MAKE) conf-sys
# 	$(MAKE) ssh-perms
# 	$(MAKE) gnupg-perms
# 	$(MAKE) ensure-dirs
# 	$(MAKE) pyenv
# 	@echo "Done"

# install-rust:
# 	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh