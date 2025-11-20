#!/usr/bin/env bash
set -e

# local quick build script
REPO=openwrt
if [ ! -d "$REPO" ]; then
  git clone https://github.com/openwrt/openwrt.git $REPO
fi
cd $REPO

./scripts/feeds update -a
./scripts/feeds install -a

if [ -f ../.config ]; then
  cp ../.config .config
fi

make defconfig
make -j$(nproc) || make -j1 V=s

# result in bin/targets/x86/64/
