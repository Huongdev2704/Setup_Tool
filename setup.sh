#!/data/data/com.termux/files/usr/bin/bash

clear
echo "⚡ Đang cài môi trường..."

pkg update -y && pkg upgrade -y
termux-setup-storage
pkg install -y python android-tools git

pip install --upgrade pip
pip install requests rich pure-python-adb

echo "✅ Cài đặt hoàn tất!"
