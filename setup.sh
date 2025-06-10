#!/data/data/com.termux/files/usr/bin/bash

pkg update -y && pkg upgrade -y
pkg install git -y
pkg install proot-distro -y

git clone https://github.com/termux/proot-distro
cd proot-distro
./install.sh

proot-distro install ubuntu

proot-distro login ubuntu -- bash -c "
apt update -y
apt install python3 python3-pip -y
echo '✅ Cài xong tất cả thư viện!'"
