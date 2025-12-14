#!/bin/bash

# Check that exactly one argument is provided
if [ $# -ne 1 ]; then
  echo "Usage: $0 adresse"
  exit 1
fi

addr="$1"

# ---- IPv4 check ----
if echo "$addr" | grep -E -q '^([0-9]{1,3}\.){3}[0-9]{1,3}$'; then
    ok=1

    # Split the address into octets
    IFS='.' read -r o1 o2 o3 o4 <<< "$addr"

    for octet in $o1 $o2 $o3 $o4; do
        if [ "$octet" -gt 255 ]; then
            ok=0
            break
        fi
    done

    if [ $ok -eq 1 ]; then
        echo "Adresse IPv4 valide : $addr"
        exit 0
    fi
fi

# ---- Hostname check ----
if echo "$addr" | grep -E -q '^[A-Za-z0-9]([A-Za-z0-9-]*[A-Za-z0-9])?(\.[A-Za-z0-9]([A-Za-z0-9-]*[A-Za-z0-9])?)*$'; then
    echo "Adresse texte / nom d'hôte : $addr"
    exit 0
fi

echo "Adresse invalide : $addr"
exit 1
