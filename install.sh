#!/usr/bin/env bash
set -eu

if ! [ -d "$HOME/Library/Application Support/Quassel" ]; then
    echo 'Install Quassel: https://quassel-irc.org/downloads'
    exit 1
fi

if ! command -v coffee >/dev/null 2>&1; then
    echo 'CoffeeScript must be installed locally'
    echo 'Usually: npm install --global coffeescript'
    exit 1
fi

main () {
    local -r scripts_dir="$HOME/Library/Application Support/Quassel/scripts"

    mkdir -p "$scripts_dir"
    coffee -c itunes-np.coffee
    echo '#!/usr/bin/osascript -l JavaScript' > .temp.js
    cat itunes-np.js >> .temp.js
    mv .temp.js itunes-np.js
    chmod 0755 itunes-np.js
    cp itunes-np.js "${scripts_dir}/mpris"
    rm itunes-np.js

    echo 'Installation complete'
}

main
