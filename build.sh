VERSION="$(jq -r '.version' ./src/info.json)"

mkdir build
pushd build
rsync -av ../src/ ./Permanence_$VERSION/
zip -v -r Permanence_$VERSION.zip ./Permanence_$VERSION
popd
