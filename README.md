# k01-os

Personal [BlueBuild](https://blue-build.org) image. Not an official Bazzite or
Bluefin variant — rebased from `ghcr.io/ublue-os/bazzite-gnome-nvidia:stable` with
Hyprland baked in as the daily-driver session (niri kept installed as a fallback
session in the GDM picker), plus Kali and Arch/AUR
[distrobox](https://distrobox.it) containers provisioned automatically on first
boot.

Shell on top of Hyprland is [Ambxst](https://github.com/Axenide/Ambxst)
(`curl -L get.axeni.de/ambxst | sh`, run by hand after first boot — not baked
into the image) with [hyprglaze](https://github.com/slastra/hyprglaze) as the
shader wallpaper daemon (built from source in `$HOME` via the `zig` toolchain
baked into the image). hyprglaze needs Hyprland 0.55+ with `hyprland.lua`.

## Rebase

```
sudo rpm-ostree rebase ostree-unverified-registry:ghcr.io/kei-nyxseth/k01-os:latest
```
