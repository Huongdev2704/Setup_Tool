#!/data/data/com.termux/files/usr/bin/bash

termux-setup-storage
pkg update -y && pkg upgrade -y
pkg install git -y
pkg install proot-distro -y

# Xóa Ubuntu cũ (25.10) và cài lại Ubuntu 24.04 (noble)
proot-distro remove ubuntu
proot-distro install ubuntu --release noble

proot-distro login ubuntu -- bash -c "
# Đảm bảo sources.list dùng noble
echo 'deb http://ports.ubuntu.com/ubuntu-ports noble main restricted universe multiverse
deb http://ports.ubuntu.com/ubuntu-ports noble-updates main restricted universe multiverse
deb http://ports.ubuntu.com/ubuntu-ports noble-security main restricted universe multiverse' > /etc/apt/sources.list
rm -rf /etc/apt/sources.list.d/*

# Cài Python 3.12.3 (mặc định của noble)
apt update -y
apt install python3 python3-pip python3-venv -y

# Set alias cho python
update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# Kiểm tra version
python3 --version
echo '✅ Cài xong Python 3.12.3, pip và venv!'
"
