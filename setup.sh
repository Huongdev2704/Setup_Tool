#!/data/data/com.termux/files/usr/bin/bash

clear
echo "⚡ Đang cài môi trường..."
pkg update -y && pkg upgrade -y

pkg install -y python android-tools git
echo "📂 Cấp quyền bộ nhớ..."
termux-setup-storage

pip install --upgrade pip
pip install requests rich pure-python-adb pycryptodomex certifi

echo "✅ Cài đặt hoàn tất!"
