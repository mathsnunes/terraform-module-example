#!/usr/bin/env bash

root="$(git rev-parse --show-toplevel)"
asd_path="$HOME/.asdf/asdf.sh"

# shellcheck disable=SC1090
source "$asd_path" || {
	echo "~~> Installing asdf"
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch "v0.7.8"
	echo -e "\n source $asd_path" >>"$HOME"/.bashrc
	test -f "$HOME"/.zshrc &&
		echo -e "\n source $asd_path" >>"$HOME"/.zshrc
	source "$asd_path"
}

echo "~~> Installing asdf plugins"
while IFS= read -r plugin; do
	asdf plugin-add "$plugin"
done < <(sed '/^$/d' "$root/.tool-versions" | awk '{print $1}')

asdf install