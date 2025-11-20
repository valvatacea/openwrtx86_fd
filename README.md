# openwrtx86_fd

1. Buat repo GitHub baru (misal openwrt-usb-builder) dan push file-file: .github/workflows/build-openwrt.yml + .config + folder scripts/ + build.sh.


2. Jalankan workflow (Actions → Build OpenWrt USB Full 8GB → Run workflow).


3. Download artifact openwrt-usb-8gb dari Actions setelah build selesai. File yang dicari: openwrt-x86-64-generic-ext4-combined.img.gz atau openwrt-x86-64-generic-squashfs-combined.img.gz.


4. Tulis image ke USB:

Linux: gunzip openwrt-*.img.gz && sudo dd if=openwrt-*.img of=/dev/sdX bs=4M status=progress && sync

Windows: gunakan balenaEtcher atau Rufus.



5. Boot dari USB — setelah boot pertama script resize_root akan dijalankan (jika kamu menyalin file ke files/etc/init.d/ sebelum build), lalu memperbesar partisi terakhir dan resize filesystem ke ukuran penuh (8GB).

