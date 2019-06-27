#!/bin/sh
VERSION="$(jq -r '.version' ./src/info.json)"

mkdir build
pushd build
rsync -av ../src/ ./Permanence_$VERSION/
cp ../icon.png ./Permanence_$VERSION/thumbnail.png
zip -v -r Permanence_$VERSION.zip ./Permanence_$VERSION
popd
