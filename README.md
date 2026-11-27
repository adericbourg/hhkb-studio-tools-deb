# hhkb-studio-tools-deb

Unofficial Debian package of [yuja/hhkb-studio-tools](https://github.com/yuja/hhkb-studio-tools),
a Linux tool to modify the HHKB Studio keymap.

## Install

From the APT repository:

```shell
sudo curl -fsSLo /usr/share/keyrings/hhkb-studio-tools.gpg https://www.dericbourg.net/hhkb-studio-tools-deb/hhkb-studio-tools.gpg
echo "deb [signed-by=/usr/share/keyrings/hhkb-studio-tools.gpg] https://www.dericbourg.net/hhkb-studio-tools-deb ./" | sudo tee /etc/apt/sources.list.d/hhkb-studio-tools.list
sudo apt update && sudo apt install hhkb-studio-tools
```

Or download the latest `.deb` from [Releases](../../releases/latest), then:

```shell
sudo apt install ./hhkb-studio-tools_*_amd64.deb
```

See the [upstream README](https://github.com/yuja/hhkb-studio-tools#usage) for usage
(hidraw permissions, reading and writing profiles).

## How it works

- `UPSTREAM_COMMIT` pins the upstream commit that gets packaged.
- A weekly workflow compares it with upstream `HEAD`. When upstream moved, it bumps the pin,
  builds the `.deb`, publishes it as a GitHub release and deploys a signed APT repo to GitHub Pages.
- Version scheme: `0.0.0+git<upstream commit count>.<short sha>`, e.g. `0.0.0+git43.cf3255f`.
  The count only grows, so APT always sees a newer version.

## Build locally

```shell
cargo install cargo-deb
./build.sh   # .deb lands in dist/
```
