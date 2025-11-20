#!/bin/sh
set -e

# copy init script
mkdir -p files/etc/init.d
cp scripts/init_resize_root files/etc/init.d/resize_root
chmod +x files/etc/init.d/resize_root

# enable script by default
# will be copied into image overlay during build if using image builder or by adding to files/ dir

# contoh copy: (jika kamu menggunakan repo openwrt root)
# cp -r files openwrt/

# optional: create marker to auto-run post-install on first boot
# touch files/etc/resize_root_marker

echo "post_install prepared: init_resize_root placed into files/etc/init.d/"
