#!/bin/sh
set -euo pipefail

# Mod version
VERSION="0.1.7"
echo "Mod version $VERSION"

# Create a new and empty output directory
rm -rf out
mkdir out

# Prepare files for a new zip package
cp -rv src/     ./out/Permanence_$VERSION/
cp     icon.png ./out/Permanence_$VERSION/thumbnail.png

# Enter Build directory
cd out

# Create the zip
zip -v -r Permanence_$VERSION.zip ./Permanence_$VERSION
echo "Created: out/Permanence_$VERSION.zip"
