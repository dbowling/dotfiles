
status:
	chezmoi status

verify:
	chezmoi verify

all: 

# Apply the chezmoi config
apply: 
	chezmoi apply

# No real installing to do, so just alias this via a dependency
install: apply
	

# Make all changes without prompting
force: 
	chezmoi apply --force