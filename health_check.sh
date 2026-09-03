#!/usr/bin/env bash
# ==============================================================================
# Script Name: health_check.sh
# Description: Host Health Agent - System diagnostic and monitoring script.
# ==============================================================================

clear

echo "=========================================="
echo "          SYSTEM HEALTH REPORT            "
echo "=========================================="

echo "--- System & Uptime ---"
hostname
uptime

echo ""
echo "--- Storage Usage ---"
df -h /

echo ""
echo "--- Memory Usage ---"
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS Memory Reporting
    vm_stat | head -n 5
else
    # Linux Memory Reporting
    free -h
fi

echo ""
echo "--- Network Address ---"
if [[ "$OSTYPE" == "darwin"* ]]; then
    ipconfig getifaddr en0 2>/dev/null || echo "No active interface found"
else
    ip -br addr | grep -v "127.0.0.1" | awk '{print $1, $3}'
fi

echo ""
echo "--- System Status Alert ---"
# Parse root disk usage percentage as an integer
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$DISK_USAGE" -gt 80 ]; then
    echo "WARNING: High disk usage detected! (${DISK_USAGE}%)"
else
    echo "OK: Disk usage is healthy at ${DISK_USAGE}%."
fi
