#!/bin/bash
echo "=== PHOENIX FORTRESS: REFINED INTERNET PORT AUDIT ==="
echo "Scanning for active internet listeners (TCP/UDP)..."
netstat -an -p tcp | grep LISTEN || ss -t -l

echo "=== REFINED AUDIT COMPLETE ==="
