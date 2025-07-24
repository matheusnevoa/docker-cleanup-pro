#!/bin/bash
mkdir -p "$HOME/.local/bin"
curl -sSL https://raw.githubusercontent.com/matheusnevoa/docker-cleanup-pro/refs/heads/main/docker-cleanup-pro.sh -o "$HOME/.local/bin/docker-cleanup-pro"
chmod +x "$HOME/.local/bin/docker-cleanup-pro"

export PATH="$HOME/.local/bin:$PATH"