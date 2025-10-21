#!/data/data/com.termux/files/usr/bin/bash

pkg update -y && pkg upgrade -y
pkg install proot-distro wget -y

proot-distro remove ubuntu 2>/dev/null || true

mkdir -p ~/ubuntu-rootfs
cd ~/ubuntu-rootfs
wget https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-arm64-root.tar.xz
tar -xJf noble-server-cloudimg-arm64-root.tar.xz -C ~/

# Giả sử giải nén ra thư mục gốc ở ~/, import
proot-distro import ubuntu-24.04 ~/

proot-distro login ubuntu-24.04 -- bash -c "
apt update -y
apt install python3 python3-pip -y
python3 --version
echo '✅ Ubuntu 24.04 LTS + Python 3.12.3!'
"
