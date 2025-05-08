#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")

TARGET_PATH="$SCRIPT_DIR/run.sh"

AUTOSTART_DIR="/etc/xdg/autostart"

SHORTCUT_NAME="run_auto.desktop"

if [ ! -d "$AUTOSTART_DIR" ]; then
    echo "Autostart directory not found: $AUTOSTART_DIR"
    exit 1
fi

cat <<EOF > "$AUTOSTART_DIR/$SHORTCUT_NAME"
[Desktop Entry]
Type=Application
Exec=$TARGET_PATH
Name=Run Auto
Comment=Start run.sh automatically
X-GNOME-Autostart-enabled=true
EOF

chmod +x "$AUTOSTART_DIR/$SHORTCUT_NAME"

echo "✅ Shortcut for run.sh has been created in the global autostart directory: $AUTOSTART_DIR/$SHORTCUT_NAME"
