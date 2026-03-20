#!/usr/bin/env bash
set -euo pipefail

RootPath="$(cd "$(dirname "$0")/.." && pwd)"
PrivatePath="$RootPath/../DesktopPrivate"

if [ ! -f "$PrivatePath/tdesktop_update_public.pem" ]; then
  echo "Missing $PrivatePath/tdesktop_update_public.pem"
  exit 1
fi

if [ ! -f "$PrivatePath/tdesktop_update_private.pem" ]; then
  echo "Missing $PrivatePath/tdesktop_update_private.pem"
  exit 1
fi

echo "Required GitHub secrets"
echo ""
echo "UPDATER_PUBLIC_KEY"
cat "$PrivatePath/tdesktop_update_public.pem"
echo ""
echo "UPDATER_PRIVATE_KEY"
cat "$PrivatePath/tdesktop_update_private.pem"
echo ""
echo "UPDATER_PUBLIC_BETA_KEY"
cat "$PrivatePath/tdesktop_update_public.pem"
echo ""
echo "UPDATER_PRIVATE_BETA_KEY"
cat "$PrivatePath/tdesktop_update_private.pem"
echo ""
echo "TDESKTOP_API_ID"
echo "Set this to your Telegram API id."
echo ""
echo "TDESKTOP_API_HASH"
echo "Set this to your Telegram API hash."
echo ""
echo "APPLE_SIGNING_IDENTITY"
echo "Use your Developer ID Application identity."
echo ""
echo "Developer ID Application identities in keychain"
security find-identity -v -p codesigning | grep "Developer ID Application" || true
echo ""
echo "Apple Distribution identities in keychain"
security find-identity -v -p codesigning | grep "Apple Distribution" || true
echo ""
echo "Export p12 for APPLE_CERT_BASE64"
echo "security export -k ~/Library/Keychains/login.keychain-db -t identities -f pkcs12 -P '<p12-password>' -o ~/Desktop/tdesktop-github-signing.p12"
echo "base64 < ~/Desktop/tdesktop-github-signing.p12 | tr -d '\\n'"
echo ""
echo "If you use App Store Connect API for notarization"
echo "base64 < ~/Downloads/AuthKey_<KEY_ID>.p8 | tr -d '\\n'"
