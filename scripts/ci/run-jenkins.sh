#!/bin/bash -e

echo "ENVIRONMENT:"
env

# The generated binaries are not relocateable so we need to install them in a global prefix
MXE_PREFIX=/tmp/mxe-$GIT_COMMIT

make MXE_TARGETS='x86_64-w64-mingw32.static' gcc cmake zlib pthreads dlfcn-win32 mman-win32 PREFIX=$MXE_PREFIX OS_SHORT_NAME='disable-native-plugins'
make MXE_TARGETS='i686-w64-mingw32.static' gcc cmake zlib pthreads dlfcn-win32 mman-win32 PREFIX=$MXE_PREFIX OS_SHORT_NAME='disable-native-plugins'

tar cvzf mxe-osx-$GIT_COMMIT.tar.gz $MXE_PREFIX
