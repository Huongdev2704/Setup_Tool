#!/data/data/com.termux/files/usr/bin/bash

termux-setup-storage

pkg update -y && pkg upgrade -y
pkg install git proot-distro -y

proot-distro install ubuntu

proot-distro login ubuntu -- bash -c "
apt update -y

# Cài Python 3.11 + pip + venv + build tools
apt install -y software-properties-common
apt install -y python3.11 python3.11-venv python3.11-dev python3-pip \
               build-essential curl wget git

# Set python3 = python3.11
update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1

# Tạo venv
python3 -m venv venv
source venv/bin/activate

# Update pip tools
python -m pip install --upgrade pip setuptools wheel

echo '✅ Python 3.11 + venv + pip OK'
"
