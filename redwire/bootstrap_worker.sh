#!/bin/bash

# Set Root password
echo "[TASK 0] Set root password"
echo "worker" | passwd --stdin root >/dev/null 2>&1
