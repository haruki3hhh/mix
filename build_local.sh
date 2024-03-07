git clone https://github.com/srcML/srcSAX.git
git clone https://github.com/srcML/srcML.git
git clone https://github.com/srcML/nameCollector.git

# first build srcML
pushd srcML
git reset --hard origin/develop
mkdir build
cmake . --preset ubuntu-release -B build/
ninja -C build/
ninja -C build/ install
popd


pushd srcSAX
mkdir build
cmake . -B build/
make -j`nproc` -C build/
make -C build/ install
popd

pushd nameCollector
mkdir build
cmake . -B build/
make -j`nproc` -C build/
file build/bin/nameCollector
cp build/bin/nameCollector ./nameCollector
popd
