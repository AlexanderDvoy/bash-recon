# bash-recon
Ping sweep on a given subnet (default: 192.168.1.0/24)
Detects live hosts via ICMP ping
Checks if port 22 (SSH) is open using Bash’s /dev/tcp
Retrieves SSH banner if available
Logs all scan results with timestamps to a log file

Usage:
chmod +x bash-recon.sh
./bash-recon.sh

It’s recommended to run as a normal user or with sudo for best results.

Requirements
Bash shell
nc (netcat)
ping
timeout
