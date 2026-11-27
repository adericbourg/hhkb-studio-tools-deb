#!/bin/sh
# Build a .deb of upstream hhkb-studio-tools at the commit pinned in UPSTREAM_COMMIT.
set -eu
here=$(cd "$(dirname "$0")" && pwd)
src=$(mktemp -d)
trap 'rm -rf "$src"' EXIT

git clone -q https://github.com/yuja/hhkb-studio-tools "$src"
git -C "$src" checkout -q "$(cat "$here/UPSTREAM_COMMIT")"

# Upstream Cargo.toml has no description; cargo-deb uses it as the package summary.
grep -q '^description' "$src/Cargo.toml" ||
  sed -i '/^\[package\]/a description = "Linux tool to modify HHKB Studio keymap"' "$src/Cargo.toml"
cat "$here/metadata.toml" >> "$src/Cargo.toml"

# Fixed 0.0.0 prefix: any real upstream release sorts above these snapshots.
version="0.0.0+git$(git -C "$src" rev-list --count HEAD).$(git -C "$src" rev-parse --short=7 HEAD)"

mkdir -p "$here/dist"
(cd "$src" && cargo deb --locked --deb-version "$version" --output "$here/dist/")
echo "$version" > "$here/dist/VERSION"
