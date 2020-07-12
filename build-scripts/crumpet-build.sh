#!/bin/bash
sudo chown user:user /output

cd /home/user

mkdir ./appbuild
cd  ./appbuild
git clone --recursive https://github.com/MasterTailer/CRUMPET.git

# version lock for kirigami
sed -i '/set(KF5_DEP_VERSION/c\set(KF5_DEP_VERSION "5.65.0")' ./CRUMPET/3rdparty/kirigami/CMakeLists.txt
sed -i '/find_package(ECM /c\find_package(ECM 5.65.0 NO_MODULE)' ./CRUMPET/3rdparty/kirigami/CMakeLists.txt
#patch for kirigamiplugin (temp)
sed -i '1s;^;#include <QDebug>\n;' ./CRUMPET/3rdparty/kirigami/src/kirigamiplugin.h

#folder handeling
cd ./CRUMPET
rm -rf ./build
mkdir ./build
cd ./build

#ignore error this one spits out
cmake -DCMAKE_TOOLCHAIN_FILE=/opt/kdeandroid-deps/share/ECM/toolchain/Android.cmake -DECM_ADDITIONAL_FIND_ROOT_PATH=/opt/kdeandroid-deps -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=../export -DQTANDROID_EXPORTED_TARGET=digitail -DANDROID_APK_DIR=../data -DANDROID_EXTRA_LIBS=/opt/kdeandroid-deps/lib/libcrypto.so,/opt/kdeandroid-deps/lib/libssl.so .. || true

#back to actual cmake
cmake -DCMAKE_TOOLCHAIN_FILE=/opt/kdeandroid-deps/share/ECM/toolchain/Android.cmake -DECM_ADDITIONAL_FIND_ROOT_PATH=/opt/Qt/5.13.2 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=../export -DQTANDROID_EXPORTED_TARGET=digitail -DANDROID_APK_DIR=../data -DANDROID_EXTRA_LIBS=/opt/kdeandroid-deps/lib/libcrypto.so,/opt/kdeandroid-deps/lib/libssl.so ..
make
cd ./src
make install
cd ..
make create-apk-digitail ARGS="--android-platform android-26"
BUILD_DATE=$(date)
cp -r "/home/user/appbuild/CRUMPET/build/digitail_build_apk//build/outputs/apk" "/output/$1-$BUILD_DATE"

