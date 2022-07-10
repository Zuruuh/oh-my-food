#!/bin/bash
echo "Clearing previous builds..."
rm -rf ./dist

echo "Building & transpiling assets in the dist directory..."
pnpm run build:css >> /dev/null
cp -rf src dist

echo "Getting rid of files used for development..."
unlink dist/fonts &>> /dev/null
rm -rf dist/styles

echo -e "Importing 3rd party modules...\n"
cp -rf ./node_modules/@fortawesome/fontawesome-free/webfonts ./dist/fonts

if [ "$(uname -s)" = "Darwin" ]; then
  sed -i "" "s?\.\./\.\./fonts?./fonts?g" ./dist/styles.css >> /dev/null
else
  sed -i "s?\.\./\.\./fonts?./fonts?g" ./dist/styles.css >> /dev/null
fi

echo "Done! Your production-ready files are located in $PWD/dist !"
