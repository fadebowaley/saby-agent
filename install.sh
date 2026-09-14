#!/usr/bin/env bash
set -euo pipefail

# Saby agent bootstrap installer.
#
# Downloads the latest release from GitHub and installs it globally, then
# hands off to `saby setup` for interactive onboarding.
#
#   curl -fsSL https://github.com/fadebowaley/saby-agent/releases/latest/download/install.sh | sh
#
# Overrides:
#   SABY_RELEASE_BASE  base URL of the release assets (default: latest on GitHub)

DEFAULT_BASE="https://github.com/fadebowaley/saby-agent/releases/latest/download"
BASE="${SABY_RELEASE_BASE:-$DEFAULT_BASE}"

uname_s="$(uname -s)"
uname_m="$(uname -m)"
case "${uname_s}:${uname_m}" in
  Linux:x86_64) PLATFORM="linux-x64" ;;
  Linux:aarch64 | Linux:arm64) PLATFORM="linux-arm64" ;;
  Darwin:arm64) PLATFORM="darwin-arm64" ;;
  Darwin:x86_64) PLATFORM="darwin-x64" ;;
  *)
    echo "error: unsupported platform ${uname_s}/${uname_m}" >&2
    exit 1
    ;;
esac

echo "Downloading Saby agent for ${PLATFORM} from ${BASE}..."
TMP="$(mktemp -d)"
trap 'rm -rf "${TMP}"' EXIT

curl -fsSL "${BASE}/saby-agent-${PLATFORM}.tar.gz" -o "${TMP}/saby-agent-${PLATFORM}.tar.gz"

if curl -fsSL "${BASE}/saby-agent-SHA256SUMS.txt" -o "${TMP}/SHA256SUMS.txt" 2>/dev/null; then
  (cd "${TMP}" && grep "saby-agent-${PLATFORM}.tar.gz" SHA256SUMS.txt | shasum -a 256 -c -)
fi

tar -xzf "${TMP}/saby-agent-${PLATFORM}.tar.gz" -C "${TMP}"
rm -f "${TMP}/saby-agent-${PLATFORM}.tar.gz" "${TMP}/SHA256SUMS.txt"
chmod +x "${TMP}/install.sh"
echo
bash "${TMP}/install.sh"