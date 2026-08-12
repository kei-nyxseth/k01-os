# k01-os

Personal [BlueBuild](https://blue-build.org) image. Not an official Bazzite or
Bluefin variant — rebased from `ghcr.io/ublue-os/bazzite-gnome-nvidia:stable` with
niri + [DankMaterialShell](https://github.com/AvengeMedia/DankMaterialShell) baked
in, plus Kali and Arch/AUR [distrobox](https://distrobox.it) containers provisioned
automatically on first boot.

## Rebase

```
sudo rpm-ostree rebase ostree-unverified-registry:ghcr.io/kei-nyxseth/k01-os:latest
```
