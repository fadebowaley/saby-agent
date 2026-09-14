# Saby agent

The governed Saby copilot for your terminal — public binary releases,
global installer, and self-contained bundles.

This repo holds only release artifacts. Source stays in the private
development repository.

## Install

```sh
curl -fsSL https://github.com/fadebowaley/saby-agent/releases/latest/download/install.sh | sh
```

This downloads the latest release for your OS (Linux x64 or macOS arm64),
installs it globally (`~/.local/bin`, or `/usr/local/bin` when run as root),
and tells you to run `saby setup`.

## First run

```sh
saby setup
```

Fully interactive — it:

1. signs you in to the model provider (OpenCode Zen),
2. signs you in to your Saby workspace,
3. saves `SABY_BACKEND_URL` / `SABY_FRONTEND_URL` so every session is ready.

Then:

```sh
saby            # opens the governed copilot
```

## Manual install

```sh
curl -fsSL -O https://github.com/fadebowaley/saby-agent/releases/latest/download/saby-agent-linux-x64.tar.gz
tar -xzf saby-agent-linux-x64.tar.gz
cd saby-agent
./install.sh
```

macOS (arm64) uses `saby-agent-darwin-arm64.tar.gz`.

Each release's checksums live in `saby-agent-SHA256SUMS.txt`.

## Releases

New versions are published as GitHub releases with three stable assets;
`releases/latest` always points at the newest:

| Asset | Platform |
| --- | --- |
| `saby-agent-linux-x64.tar.gz` | Linux x86_64 |
| `saby-agent-darwin-arm64.tar.gz` | macOS arm64 |
| `saby-agent-SHA256SUMS.txt` | checksums for both |

A `saby update` command (self-update in the launcher) is planned.

## License

Proprietary — © Saby.