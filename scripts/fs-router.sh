#!/bin/bash
IFS='
'

# Actually updates the html files to extract them into separates directories
function run() {
    local files
    files=$(/bin/ls -1 -- "./$1")

    for file in $files; do
        if [ "$file" = "index.html" ]; then
            continue
        fi

        local path="$1/$file"
        if [ -d "$path" ]; then
            run "$path"
            continue
        fi

        if ! grep -qE ".html" <<< "$file"; then
          continue
        fi

        local length=${#path}
        length=$((length-5))

        local dir="/usr/bin/cut -c 1-$length <<< \"$path\""
        dir=$(eval "$dir")

        if [[ ! -d $dir ]]; then
            mkdir "$dir"
        fi

        mv "$path" "$dir"/index.html
        sed -i "s/index.html//g" "$dir"/index.html >> /dev/null
        sed -i "s/.html//g" "$dir"/index.html >> /dev/null
    done
}

run "$1"
