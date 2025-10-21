#!/data/data/com.termux/files/usr/bin/bash

termux-setup-storage
pkg update -y && pkg upgrade -y
pkg install git -y
pkg install proot-distro -y

git clone https://github.com/termux/proot-distro
cd proot-distro
./install.sh

proot-distro install ubuntu

proot-distro login ubuntu -- bash -c "
apt update -y
apt install software-properties-common -y
add-apt-repository ppa:deadsnakes/ppa -y
apt update -y
apt install python3.12 python3.12-venv python3.12-dev python3-pip -y

# Set python3 mặc định là 3.12
update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.12 2

echo ''
python3 --version
pip3 --version
echo '✅ Cài Python 3.12 thành công!'
"
