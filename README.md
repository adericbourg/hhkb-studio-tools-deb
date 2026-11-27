# hhkb-studio-tools-deb

Unofficial Debian package of [yuja/hhkb-studio-tools](https://github.com/yuja/hhkb-studio-tools),
a Linux tool to modify the HHKB Studio keymap.

## Install

Download the latest `.deb` from [Releases](../../releases/latest), then:

```shell
sudo apt install ./hhkb-studio-tools_*_amd64.deb
```

See the [upstream README](https://github.com/yuja/hhkb-studio-tools#usage) for usage
(hidraw permissions, reading and writing profiles).

## How it works

- `UPSTREAM_COMMIT` pins the upstream commit that gets packaged.
- A daily workflow compares it with upstream `HEAD`. When upstream moved, it bumps the pin,
  builds the `.deb` and publishes it as a GitHub release.
- Version scheme: `<cargo version>+git<commit date>.<short sha>`, e.g. `0.1.0+git20260120.8b51948`.

## Build locally

```shell
cargo install cargo-deb
./build.sh   # .deb lands in dist/
```
