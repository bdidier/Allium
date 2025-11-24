#!/usr/bin/env bash

set -eo pipefail

say "Starting Scraper..."

if "$ROOT"/.allium/scripts/wait-for-wifi.sh; then
    say "WiFi connected, launching Scraper..."

    "$ROOT/.allium/bin/collie" --roms-path=/mnt/SDCARD/Roms > collie.log
    exit 0
fi

say "WiFi failed to connect, cannot launch Scraper."
exit 1
