#!/bin/bash

# ------------------------------------------------------
# Script to run Netdata container with basic setup
# This version runs Netdata in isolation (limited monitoring)
# ------------------------------------------------------

docker run -d \                         # Run the container in detached mode (in the background)
  --name=netdata \                      # Set the container name to 'netdata'
  -p 19999:19999 \                      # Map port 19999 of the container to the host (access Netdata at http://localhost:19999)
  netdata/netdata                       # Use the official Netdata image from Docker Hub
#-------------------------------------------------------------------------------------------------------------------------------------
# -------------------------------------------------------
# Script to run Netdata with full system monitoring enabled
# using Docker. This version mounts host paths to allow
# Netdata to collect system-wide metrics.
# -------------------------------------------------------

docker run -d \                                  # Run the container in detached mode
  --name=netdata1 \                              # Assign the container a name: 'netdata'
  -p 19990:19999 \                               # Map port 19999 on host to container (Netdata UI access)
  --cap-add SYS_PTRACE \                         # Allow the container to trace system processes (for deep monitoring)
  --security-opt apparmor=unconfined \           # Relax AppArmor security to avoid restrictions
  -v /etc/passwd:/host/etc/passwd:ro \           # Mount host passwd file (read-only) to map usernames in metrics
  -v /proc:/host/proc:ro \                       # Mount host's /proc directory (contains process info)
  -v /sys:/host/sys:ro \                         # Mount host's /sys directory (contains kernel and hardware info)
  -v /etc/os-release:/host/etc/os-release:ro \   # Mount host OS info file to identify the operating system
  netdata/netdata                                # Use the official Netdata image from Docker Hub
