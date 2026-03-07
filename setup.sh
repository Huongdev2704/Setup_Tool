#!/data/data/com.termux/files/usr/bin/bash

clear
echo "⚡ Đang cài môi trường..."

termux-setup-storage

pkg update -y && pkg upgrade -y

pkg install -y python android-tools git

pip install --upgrade pip
pip install requests rich pure-python-adb

echo "✅ Cài đặt hoàn tất!"
