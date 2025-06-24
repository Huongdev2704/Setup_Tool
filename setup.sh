#!/data/data/com.termux/files/usr/bin/bash

# Yêu cầu quyền truy cập bộ nhớ
termux-setup-storage

# Cập nhật và cài gói cần thiết
pkg update -y && pkg upgrade -y
pkg install git -y
pkg install proot-distro -y

# Clone và cài proot-distro nếu chưa có
git clone https://github.com/termux/proot-distro
cd proot-distro
./install.sh

# Cài Ubuntu
proot-distro install ubuntu

# Login vào Ubuntu và cài Python 3.11.0 từ nguồn
proot-distro login ubuntu -- bash -c "
apt update -y && apt upgrade -y

# Cài đặt các phụ thuộc cần thiết để biên dịch Python
apt install -y wget build-essential libssl-dev zlib1g-dev \
libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev \
libgdbm-dev libdb5.3-dev libbz2-dev libexpat1-dev liblzma-dev tk-dev

# Tải và biên dịch Python 3.11.0
cd /tmp
wget https://www.python.org/ftp/python/3.11.0/Python-3.11.0.tgz
tar -xf Python-3.11.0.tgz
cd Python-3.11.0
./configure --enable-optimizations
make -j\$(nproc)
make altinstall

# Kiểm tra phiên bản và cài pip
echo '✅ Python 3.11.0 đã được cài:'
python3.11 --version
python3.11 -m ensurepip --upgrade
python3.11 -m pip install --upgrade pip

echo '✅ Cài xong tất cả thư viện!'
"
