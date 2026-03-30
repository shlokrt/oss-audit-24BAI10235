#!/bin/bash
# =============================================================
# Script 4: Log File Analyzer
# Author: Shlok Khanna | Roll No.: 24BAI10235
# Course: Open Source Software | Chosen Software: Git
# Description: Reads a log file line by line, counts keyword
#              matches, retries if empty, prints last 5 matches
# Usage: ./script4_log_analyzer.sh <logfile> [keyword]
# =============================================================

# $1 = log file path from command line
LOGFILE=$1
# $2 = keyword; defaults to "error" if not supplied
KEYWORD=${2:-"error"}
COUNT=0

# --- Validate that a file path was provided ---
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/syslog error"
    exit 1
fi

# --- Check if the file exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    exit 1
fi

# --- Do-while style retry if the file is empty ---
RETRIES=0
MAX_RETRIES=3

while [ ! -s "$LOGFILE" ] && [ $RETRIES -lt $MAX_RETRIES ]; do
    echo "Warning: '$LOGFILE' is empty (attempt $((RETRIES + 1)) of $MAX_RETRIES)."
    RETRIES=$((RETRIES + 1))
    read -p "Enter a different log file path (or press Enter to exit): " NEW_FILE
    if [ -z "$NEW_FILE" ]; then
        echo "Exiting."
        exit 0
    fi
    LOGFILE=$NEW_FILE
    if [ ! -f "$LOGFILE" ]; then
        echo "Error: '$LOGFILE' not found."
    fi
done

# --- Main loop: read the file line by line ---
# IFS= preserves whitespace; -r prevents backslash interpretation
while IFS= read -r LINE; do
    # grep -iq does case-insensitive match
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

# --- Print summary ---
echo ""
echo "===== Log File Analysis Report ====="
echo "  File    : $LOGFILE"
echo "  Keyword : '$KEYWORD' (case-insensitive)"
echo "  Matches : $COUNT line(s) found"
echo ""

# --- Print last 5 matching lines ---
if [ $COUNT -gt 0 ]; then
    echo "--- Last 5 lines matching '$KEYWORD' ---"
    grep -i "$KEYWORD" "$LOGFILE" | tail -5
else
    echo "No lines matching '$KEYWORD' were found."
fi