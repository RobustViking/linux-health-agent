# linux-health-agent
A lightweight POSIX Bash script for host diagnostics, resource threshold alerting, and logging.
# Host Health Agent & Diagnostic Tool

A lightweight POSIX-compliant Bash script designed to inspect system resources, evaluate storage thresholds, and generate structured health reports.

## Features
* **System Metrics:** Pulls host identity, system uptime, and average load.
* **Resource Monitoring:** Reports root filesystem utilization and memory metrics.
* **Network Inspection:** Identifies active primary local IP addresses.
* **Automated Alerting:** Evaluates disk capacity against an 80% warning threshold using standard conditional logic.
* **Dual Output Stream:** Supports terminal rendering alongside persistent log file storage via process piping.

## Prerequisites & Compatibility
* Tested on macOS (zsh/bash) and generic Linux environments.
* Requires standard POSIX command-line utilities (`df`, `awk`, `tr`, `tee`).

## Usage

1. Make the script executable:
   ```bash
   chmod +x health_check.sh
   ```

2. Run the script in terminal:
   ```bash
   ./health_check.sh
   ```

3. Run and append output to a log file:
   ```bash
   ./health_check.sh | tee system_health.log
   ```

## Sample Output
```text
==========================================
          SYSTEM HEALTH REPORT            
==========================================
--- System & Uptime ---
Staffords-MacBook-Air.local
15:10 up 2 days, 7:02, 1 user, load averages: 1.84 1.85 1.92

--- Storage Usage ---
Filesystem     Size   Used  Avail Capacity iused ifree %iused Mounted on
/dev/disk3s1s1 460Gi  12Gi  272Gi     5%   459k  2.8G    0%   /

--- Memory Usage ---
Mach Virtual Memory Statistics: (page size of 16384 bytes)
Pages free:                   4096.
Pages active:               121131.

--- Network Address ---
172.20.10.12

--- System Status Alert ---
OK: Disk usage is healthy at 5%.
```
