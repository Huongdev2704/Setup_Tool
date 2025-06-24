#!/data/data/com.termux/files/usr/bin/bash

termux-setup-storage
pkg update -y && pkg upgrade -y
pkg install git -y
pkg install proot-distro -y

# Clone tool proot-distro (nếu cần)
git clone https://github.com/termux/proot-distro
cd proot-distro
./install.sh

# Cài Ubuntu (LTS)
proot-distro install ubuntu

# Cài Python 3.11 trong Ubuntu
proot-distro login ubuntu -- bash -c "
apt update -y
apt install software-properties-common -y
add-apt-repository ppa:deadsnakes/ppa -y
apt update -y
apt install python3.11 python3.11-venv python3.11-dev -y
update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1
python3 --version
echo '✅ Đã cài xong tất cả các thư viện!'"
