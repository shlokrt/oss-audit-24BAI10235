#!/bin/bash
# =============================================================
# Script 3: Disk and Permission Auditor
# Author: Shlok Khanna | Roll No.: 24BAI10235
# Course: Open Source Software | Chosen Software: Git
# Description: Loops through key system directories and reports
#              permissions, owner, and disk usage.
#              Also checks Git config file locations.
# =============================================================

# Array of important system directories to audit
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "===== Directory Audit Report ====="
echo ""

# --- For loop: iterate over each directory in the array ---
for DIR in "${DIRS[@]}"; do

    # -d checks if the path exists and is a directory
    if [ -d "$DIR" ]; then
        # awk extracts permissions, owner, group from ls output
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        # du -sh gives human-readable size
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        echo "  $DIR"
        echo "    Permissions/Owner : $PERMS"
        echo "    Disk Usage        : $SIZE"
        echo ""
    else
        echo "  $DIR — does not exist on this system"
        echo ""
    fi
done

echo "--------------------------------------------------"
echo "  Git Configuration File Audit"
echo "--------------------------------------------------"
echo ""

# --- Check system-wide Git config ---
GIT_SYS_CONFIG="/etc/gitconfig"
if [ -f "$GIT_SYS_CONFIG" ]; then
    PERMS=$(ls -l "$GIT_SYS_CONFIG" | awk '{print $1, $3, $4}')
    SIZE=$(du -sh "$GIT_SYS_CONFIG" 2>/dev/null | cut -f1)
    echo "  System-wide config : $GIT_SYS_CONFIG"
    echo "    Permissions/Owner  : $PERMS | Size: $SIZE"
else
    echo "  No system-wide git config found at $GIT_SYS_CONFIG"
fi

echo ""

# --- Check user-level Git config ---
GIT_USER_CONFIG="$HOME/.gitconfig"
if [ -f "$GIT_USER_CONFIG" ]; then
    PERMS=$(ls -l "$GIT_USER_CONFIG" | awk '{print $1, $3, $4}')
    SIZE=$(du -sh "$GIT_USER_CONFIG" 2>/dev/null | cut -f1)
    echo "  User-level config  : $GIT_USER_CONFIG"
    echo "    Permissions/Owner  : $PERMS | Size: $SIZE"
else
    echo "  No user git config found at $GIT_USER_CONFIG"
    echo "  Tip: Run the following to create it:"
    echo "    git config --global user.name  \"Your Name\""
    echo "    git config --global user.email \"you@example.com\""
fi