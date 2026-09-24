#!/bin/bash
NM_DIR="/etc/NetworkManager/system-connections"
LOCAL_BIN="$HOME/.local/bin"

echo "Checking root privileges for NetworkManager directory..."
if [ "$EUID" -ne 0 ]; then
    echo "Please run the installer with sudo or root privileges to write the system connection file."
    exit 1
fi

echo "Installing network profile for CLI and GUI managers..."
cp steam-hotspot.nmconnection "$NM_DIR/SteamHotspot.nmconnection"
chmod 600 "$NM_DIR/SteamHotspot.nmconnection"
chown root:root "$NM_DIR/SteamHotspot.nmconnection"

echo "Reloading NetworkManager..."
nmcli connection reload

echo "Setting up user toggle binary..."
mkdir -p "$LOCAL_BIN"
cp toggle-hotspot.sh "$LOCAL_BIN/toggle-hotspot"
chmod +x "$LOCAL_BIN/toggle-hotspot"

echo "Installation complete. Edit password in $NM_DIR/SteamHotspot.nmconnection if needed."
