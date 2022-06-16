#!/bin/sh

OUT_DIR=dist
PAGES_DIR=pages
TEMP_DIRNAME=__PAGES

# Extracts all the html pages from the dist/pages directory
mv $OUT_DIR/$PAGES_DIR $OUT_DIR/$TEMP_DIRNAME
mv $OUT_DIR/$TEMP_DIRNAME/* $OUT_DIR/
rm -rf $OUT_DIR/$TEMP_DIRNAME
