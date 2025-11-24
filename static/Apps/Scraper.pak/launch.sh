#!/usr/bin/env bash

set -eo pipefail

say "Starting Scraper..."

if "$ROOT"/.allium/scripts/wait-for-wifi.sh; then
    say "WiFi connected, launching Scraper..."

    touch /tmp/stay_awake
    "$ROOT/.allium/bin/collie" --bind 0.0.0.0 > collie.log
    rm /tmp/stay_awake
    exit 0
fi

say "WiFi failed to connect, cannot launch Scraper."
exit 1
