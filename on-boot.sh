#!/usr/bin/env bash

SERVICE_NAME="on-boot"
SCRIPT_PATH="$(realpath "$0")"
SERVICE_FILE="/etc/systemd/system/${SERVICE_NAME}.service"

payload() {
# ── PASTE YOUR SCRIPT BELOW AND DELETE WHATS ALREADY THERE ──────────────────────────

    echo "executed at $(date)" >> /tmp/on-boot.log

# ── PASTE YOUR SCRIPT ABOVE AND DELETE WHATS ALREADY THERE──────────────────────────
}

install_service() {
    cat > "$SERVICE_FILE" <<EOF
[Unit]
Description=on-boot
After=network.target

[Service]
Type=oneshot
ExecStart=/bin/bash ${SCRIPT_PATH} --run
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
    systemctl daemon-reload
    systemctl enable "$SERVICE_NAME"
}

uninstall_service() {
    systemctl disable --now "$SERVICE_NAME" 2>/dev/null
    rm -f "$SERVICE_FILE"
    systemctl daemon-reload
}

case "${1:-}" in
    --install)   install_service ;;
    --uninstall) uninstall_service ;;
    --run)       payload ;;
    *)           exit 0 ;;
esac
