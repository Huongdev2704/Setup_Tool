#!/data/data/com.termux/files/usr/bin/bash

pkg update -y && pkg upgrade -y
pkg install wget tar proot-distro -y
proot-distro remove ubuntu 2>/dev/null || true

mkdir -p ~/ubuntu-rootfs
cd ~/ubuntu-rootfs
wget https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-arm64-root.tar.xz
tar -xJf noble-server-cloudimg-arm64-root.tar.xz -C ~/ubuntu-rootfs
proot-distro import ubuntu-24.04 ~/ubuntu-rootfs

proot-distro login ubuntu-24.04 -- bash -c "
apt update -y
apt install -y python3 python3-pip
python3 --version
echo '✅ Installed Ubuntu 24.04 LTS with Python 3.12.3!'
"
