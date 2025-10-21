#!/data/data/com.termux/files/usr/bin/bash

# Chọn mirror cho Termux (nếu cần)
echo "Chọn mirror để đảm bảo ổn định..."
termux-change-repo

# Cập nhật và cài các gói cần thiết
pkg update -y && pkg upgrade -y
pkg install git -y
pkg install proot-distro -y

# Xóa Ubuntu cũ nếu có
proot-distro remove ubuntu

# Cài Ubuntu 24.04 (Noble) bằng custom tarball URL
export PD_OVERRIDE_TARBALL_URL="http://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-arm64-root.tar.xz"
export PD_OVERRIDE_TARBALL_STRIP_OPT=0
proot-distro install ubuntu

proot-distro login ubuntu -- bash -c "
# Cấu hình sources.list cho Ubuntu 24.04 (noble)
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
lsb_release -a
python3 --version
echo '✅ Cài xong Python 3.12.3, pip và venv!'
"
