#!/usr/bin/bash
set -euo pipefail

STAMP=/var/lib/k01-os/.provisioned
TARGET_USER="${K01_USER:-$(id -nu 1000)}"

run_as_user() {
  runuser -u "$TARGET_USER" -- "$@"
}

run_as_user distrobox create --yes --image docker.io/kalilinux/kali-rolling --name kali
run_as_user distrobox enter kali -- sudo apt-get update
run_as_user distrobox enter kali -- sudo apt-get install -y kali-linux-headless
run_as_user distrobox enter kali -- distrobox-export --bin /usr/bin/nmap --export-path "$HOME/.local/bin" || true

run_as_user distrobox create --yes --image docker.io/library/archlinux:latest --name arch
run_as_user distrobox enter arch -- sudo pacman -Sy --noconfirm base-devel git
run_as_user distrobox enter arch -- bash -c '
  set -e
  if ! command -v paru >/dev/null 2>&1; then
    tmpdir=$(mktemp -d)
    git clone https://aur.archlinux.org/paru-bin.git "$tmpdir/paru-bin"
    cd "$tmpdir/paru-bin"
    makepkg -si --noconfirm
  fi
'

mkdir -p "$(dirname "$STAMP")"
touch "$STAMP"
