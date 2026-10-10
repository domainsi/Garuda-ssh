#!/usr/bin/env bash
# ==============================================================================
# GARUDA SSH - Quick Installer & Setup Script
# Kali Linux / Debian / Ubuntu / Termux Environment
# ==============================================================================

set -e

RED="\033[91m"
GREEN="\033[92m"
YELLOW="\033[93m"
CYAN="\033[96m"
WHITE="\033[97m"
BOLD="\033[1m"
RESET="\033[0m"

echo -e "${RED}${BOLD}"
cat << "EOF"
  ██████╗  █████╗ ██████╗ ██╗   ██╗██████╗  █████╗     ███████╗███████╗██╗  ██╗
 ██╔════╝ ██╔══██╗██╔══██╗██║   ██║██╔══██╗██╔══██╗    ██╔════╝██╔════╝██║  ██║
 ██║  ███╗███████║██████╔╝██║   ██║██║  ██║███████║    ███████╗███████╗███████║
 ██║   ██║██╔══██║██╔══██║██║   ██║██║  ██║██╔══██║    ╚════██║╚════██║██╔══██║
 ╚██████╔╝██║  ██║██║  ██║╚██████╔╝██████╔╝██║  ██║    ███████║███████║██║  ██║
  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝    ╚══════╝╚══════╝╚═╝  ╚═╝
EOF
echo -e "${CYAN}        [+] GARUDA SSH - KALI LINUX INSTALLER & INITIALIZER [+]"
echo -e "${RESET}"

echo -e "${CYAN}[*] Memeriksa ketersediaan Python 3...${RESET}"
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}[!] Python 3 belum terinstal.${RESET}"
    if command -v apt &> /dev/null; then
        echo -e "${YELLOW}[*] Menginstal python3 via APT...${RESET}"
        sudo apt update && sudo apt install -y python3
    elif command -v pkg &> /dev/null; then
        echo -e "${YELLOW}[*] Menginstal python via PKG (Termux)...${RESET}"
        pkg update && pkg install -y python
    else
        echo -e "${RED}[!] Silakan install Python 3 secara manual.${RESET}"
        exit 1
    fi
fi

PYTHON_VERSION=$(python3 --version)
echo -e "${GREEN}[✔] Terdeteksi: ${PYTHON_VERSION}${RESET}"

echo -e "${CYAN}[*] Menyesuaikan izin eksekusi skrip (chmod +x)...${RESET}"
chmod +x garuda_ssh.py cerberus_engine.py install.sh 2>/dev/null || true

echo -e "${CYAN}[*] Memastikan direktori bukti (evidence)...${RESET}"
mkdir -p evidence

echo -e "\n${GREEN}${BOLD}[✔] INSTALASI BERHASIL!${RESET}"
echo -e "${WHITE}Cara menjalankan GARUDA SSH:${RESET}"
echo -e "  ${YELLOW}python3 garuda_ssh.py <target_domain>${RESET}"
echo -e "  ${CYAN}Contoh: python3 garuda_ssh.py example.com${RESET}\n"
