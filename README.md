---

1. Persiapkan USB

1. Colokkan USB drive (minimal 2 GB, sesuai image).


2. Cek device USB:


lsblk

Contoh output:

sdb      8:16   1  16G  0 disk
└─sdb1   8:17   1  16G  0 part

Pastikan device benar! Salah pilih akan menghapus data.




---

2. Unduh OpenWrt USB-ready Image

Ganti URL sesuai release terakhir:

wget https://github.com/username/repo/releases/download/v24.10.4-20251120-1732/openwrt-x86-64-usb-auto.img

Cek ukuran:

ls -lh openwrt-x86-64-usb-auto.img

Biasanya ±1.5 GB sesuai workflow build.


---

3. Tulis image ke USB

3.1 Di Linux / Termux (dengan dd)

Perhatian: Perintah ini akan menghapus seluruh USB.

sudo dd if=openwrt-x86-64-usb-auto.img of=/dev/sdX bs=4M status=progress conv=fsync

Ganti /dev/sdX dengan device USB-mu (sdb, sdc, dll.).

Sinkronkan buffer:

sync


---

3.2 Di Termux tanpa root (alternatif)

1. Install proot + pulseaudio (opsional) + qemu jika ingin mencoba image tanpa menulis ke USB.


2. Tapi untuk boot nyata, root diperlukan. Termux sendiri tidak bisa menulis langsung ke /dev/sdX tanpa root.




---

4. Boot dari USB

1. Masukkan USB ke PC.


2. Nyalakan PC, masuk BIOS/UEFI.


3. Pilih Boot from USB.



OpenWrt akan otomatis load dan interface lan akan 192.168.1.2, usb0 DHCP.


---

5. Login OpenWrt

1. Hubungkan PC lain ke LAN (kabel ke port eth0).


2. Buka browser:



http://192.168.1.2

3. Default login OpenWrt: root tanpa password (disarankan ganti setelah login).




---
