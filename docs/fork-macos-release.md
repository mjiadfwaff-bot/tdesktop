# Fork macOS Release

This repository now includes a fork-specific macOS release workflow at `.github/workflows/release-macos-arm64.yml`.

## Trigger

- Push a tag like `v6.6.4`
- Or run `Release macOS arm64` manually from GitHub Actions and provide `6.6.4`

## What it does

- Builds `rnnoise`, `tg_owt`, and `tde2e` on `macos-14`
- Builds Telegram Desktop for Apple Silicon
- Signs the app
- Creates a `.dmg`
- Creates the updater package `tarmacupd<version>`
- Publishes both files to GitHub Releases
- Publishes `current` to GitHub Pages for in-app updates

## Required repository secrets

- `TDESKTOP_API_ID`
- `TDESKTOP_API_HASH`
- `APPLE_CERT_BASE64`
- `APPLE_CERT_PASSWORD`
- `APPLE_KEYCHAIN_PASSWORD`
- `APPLE_SIGNING_IDENTITY`
- `UPDATER_PUBLIC_KEY`
- `UPDATER_PRIVATE_KEY`

## Optional repository secrets

- `UPDATER_PUBLIC_BETA_KEY`
- `UPDATER_PRIVATE_BETA_KEY`
- `APPLE_NOTARY_KEY_ID`
- `APPLE_NOTARY_ISSUER_ID`
- `APPLE_NOTARY_API_KEY_BASE64`

## Secret formats

`APPLE_CERT_BASE64`

- Base64 of the exported `.p12` signing certificate

`APPLE_SIGNING_IDENTITY`

- Example: `Developer ID Application: Your Name (TEAMID)`

`UPDATER_PUBLIC_KEY`

- RSA public key in PEM text, including begin/end lines

`UPDATER_PRIVATE_KEY`

- RSA private key in PEM text, including begin/end lines

`APPLE_NOTARY_API_KEY_BASE64`

- Base64 of `AuthKey_<KEY_ID>.p8`

## GitHub Pages

Enable GitHub Pages for this repository and set the source to `GitHub Actions`.

After a successful release, the updater feed will be available at:

- `https://mjiadfwaff-bot.github.io/tdesktop/current`

## Release flow

1. Update code and commit to `dev`
2. Push the commit
3. Create and push a tag like `v6.6.4`
4. Wait for the workflow to finish
5. Verify the release assets and Pages feed
