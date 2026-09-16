# Saby agent

The governed Saby copilot for your terminal — public binary releases,
global installer, and self-contained bundles.

This repo holds the release artifacts that power the product. The source
lives in the private development repository; everything shipped here is
built from the same source and is production-configured by default (
`https://api.saby.ai` backend, `https://saby.ai` web).

## Install

```sh
curl -fsSL https://github.com/fadebowaley/saby-agent/releases/latest/download/install.sh | sh
```

This downloads the latest release for your OS (Linux x64, Linux arm64, or
macOS arm64), installs it globally (`~/.local/bin`, or `/usr/local/bin`
when run as root), and tells you to run `saby setup`.

## First run

```sh
saby setup
```

Fully interactive — it:

1. signs you in to the model provider (OpenCode Zen / BYOK),
2. signs you in to your Saby workspace,
3. saves `SABY_BACKEND_URL` / `SABY_FRONTEND_URL` so every session is ready.

Then:

```sh
saby            # opens the governed copilot
```

The CLI talks straight to Saby production by default — no local server,
no self-hosted backend required.

## Manual install

```sh
curl -fsSL -O https://github.com/fadebowaley/saby-agent/releases/latest/download/saby-agent-linux-x64.tar.gz
tar -xzf saby-agent-linux-x64.tar.gz
cd saby-agent
./install.sh
```

macOS (arm64) uses `saby-agent-darwin-arm64.tar.gz`, Linux arm64 uses
`saby-agent-linux-arm64.tar.gz`.

Each release's checksums live in `saby-agent-SHA256SUMS.txt`.

## Uninstall

To remove the agent, its CLI symlinks, and the PATH entry:

```sh
saby-agent-uninstall
```

This leaves `~/.saby` (auth, env, logs) in place. Pass `--purge` to remove
that too:

```sh
saby-agent-uninstall --purge
```

## Releases

New versions are published as GitHub releases with four stable assets;
`releases/latest` always points at the newest:

| Asset | Platform |
| --- | --- |
| `saby-agent-linux-x64.tar.gz` | Linux x86_64 |
| `saby-agent-linux-arm64.tar.gz` | Linux arm64 |
| `saby-agent-darwin-arm64.tar.gz` | macOS arm64 |
| `saby-agent-SHA256SUMS.txt` | checksums for all |

A `saby update` command (self-update in the launcher) is planned.

## License

Proprietary — © Saby.
