#!/bin/bash
IFS='
'

# Actually updates the html files to extract them into separates directories
function run() {
    local files
    files=$(/bin/ls -1 -- "./$1")

    for file in $files; do
        local path="$1/$file"

        if [ -d "$path" ]; then
            run "$path"
            continue
        fi

        if ! grep -qE ".html" <<< "$file"; then
          continue
        fi

        local os;
        os=$(uname -s)

        if [ "$os" = "Darwin" ]; then
          sed -i "" "s/index\.html//g" "$path" >> /dev/null
          sed -i "" "s/\.html//g" "$path" >> /dev/null
        else
          sed -i "s/index\.html//g" "$path" >> /dev/null
          sed -i "s/\.html//g" "$path" >> /dev/null
        fi

        if [ "$file" = "index.html" ]; then
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
    done
}

if [[ ! -d $1 ]]; then
  echo "$1 is not a directory!"
  exit 1;
fi

# Extracts all the html pages from the dist/pages directory
# Example:
#
# dist
# ├── assets
# │   └── ...
# └── pages
#     ├── index.html
#     └── restaurants
#       ├── a-la-francaise.html
#       └── ...
#
# Transforms into:
#
# dist
# ├── assets
# │   └── ...
# ├── index.html
# └── restaurants
#     ├── a-la-francaise.html
#     └── ...

OUT_DIR=$1
PAGES_DIR=pages
TEMP_DIRNAME=__PAGES

mv $OUT_DIR/$PAGES_DIR $OUT_DIR/$TEMP_DIRNAME
mv $OUT_DIR/$TEMP_DIRNAME/* $OUT_DIR/
rm -rf $OUT_DIR/$TEMP_DIRNAME

run "$1"
