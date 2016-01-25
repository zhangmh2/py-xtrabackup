#!/bin/bash

# (C)2014 Jason Everling
# This script is provided as-is; no liability can be accepted for use.
# You are free to modify and reproduce so long as this attribution is preserved.

# For deleting xtrabackups older than mtime, 7 days, Only keeping 1 week of base and incrementals locally.
# Full nightly backups are copied off local server and archived.

path="/opt/mysql/xbackups/"
timestamp=$(date +%Y%m%d_%H%M%S)
filename=xb_retention_$timestamp.txt
log=/var/log/mysql/$filename

find $path -type d -mtime +7 -print -exec rm -rf {} + >> $log