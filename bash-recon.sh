#!/bin/bash

TARGET_SUBNET="192.168.1"
LOGFILE="scan_log.txt"

echo "[*] Starting scan on $TARGET_SUBNET.0/24" > "$LOGFILE"

for i in {1..254}; do
    IP="$TARGET_SUBNET.$i"
    if ping -c 1 -W 1 "$IP" > /dev/null; then
        echo "[+] Host $IP is up." | tee -a "$LOGFILE"
        
        timeout 1 bash -c "echo > /dev/tcp/$IP/22" 2>/dev/null && {
            echo "    [-] Port 22 open on $IP" | tee -a "$LOGFILE"

            BANNER=$(timeout 3 bash -c "echo | nc $IP 22" | head -n 1)
            echo "    [-] SSH Banner: $BANNER" | tee -a "$LOGFILE"
        }
    fi
done

echo "[*] Scan complete. Results saved to $LOGFILE"