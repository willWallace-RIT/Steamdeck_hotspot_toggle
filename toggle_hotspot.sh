#!/bin/bash
CONN_NAME="SteamHotspot"

if nmcli -t -f active,name connection show --active | grep -q "yes:$CONN_NAME"; then
    echo "Disabling wireless hotspot..."
    nmcli connection down "$CONN_NAME"
else
    echo "Enabling wireless hotspot..."
    nmcli connection up "$CONN_NAME"
fi
