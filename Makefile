.DEFAULT_GOAL := init

.PHONY: .asdf_setup
.asdf_setup:
	./.scripts/asdf_setup.sh

.PHONY: init
init: .asdf_setup