#!/bin/bash
# Linux build

make clean || echo clean

rm -f config.status
./autogen.sh || echo done

./configure CC="gcc-8" CXX="g++-8" CFLAGS="-O3 -mcpu=cortex-a53+crypto -flto -fuse-linker-plugin -funroll-loops" CXXFLAGS="-O3 -mcpu=cortex-a53+crypto -flto -fuse-linker-plugin -funroll-loops" RANLIB="aarch64-linux-gnu-gcc-ranlib-8 --plugin=$(gcc-8 --print-file-name=liblto_plugin.so)" ARFLAGS="cr --plugin=$(gcc-8 --print-file-name=liblto_plugin.so)" --with-curl --with-crypto

make -j 8 RANLIB="aarch64-linux-gnu-gcc-ranlib-8 --plugin=$(gcc-8 --print-file-name=liblto_plugin.so)" ARFLAGS=" cr --plugin=$(gcc-8 --print-file-name=liblto_plugin.so)" LDFLAGS="-O3 -mcpu=cortex-a53+crypto -flto -fuse-linker-plugin -funroll-loops" AR="aarch64-linux-gnu-gcc-ar-8"

strip -s cpuminer
