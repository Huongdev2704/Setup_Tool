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

# Login vào Ubuntu và thực hiện các lệnh bên trong
proot-distro login ubuntu -- bash -c "
apt update -y && apt upgrade -y
apt install -y wget build-essential libssl-dev zlib1g-dev \
libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev \
libgdbm-dev libdb5.3-dev libbz2-dev libexpat1-dev liblzma-dev tk-dev

cd /tmp
wget https://www.python.org/ftp/python/3.11.0/Python-3.11.0.tgz
tar -xf Python-3.11.0.tgz
cd Python-3.11.0
./configure --enable-optimizations
make -j\$(nproc)
make altinstall

echo '✅ Python đã được cài:'
python3.11 --version
"
