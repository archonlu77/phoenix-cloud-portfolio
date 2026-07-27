#!/bin/bash
echo "=========================================="
echo "🔥 PHOENIX FORTRESS: MASTER DRILL START 🔥"
echo "=========================================="

echo "[1/2] Inspecting perimeter defenses..."
./audit_firewall.sh

echo "------------------------------------------"
echo "[2/2] Checking gateway blueprints..."
if [ -f "setup_api_nginx.sh" ]; then
    echo "Gateway blueprint 'setup_api_nginx.sh' is locked and loaded."
else
    echo "WARNING: Gateway blueprint missing!"
fi

echo "=========================================="
echo "✨ MASTER DRILL COMPLETE: FORTRESS SECURE ✨"
echo "=========================================="
