#!/bin/bash
# =============================================================
# Script 2: FOSS Package Inspector
# Author: Shlok Khanna | Roll No.: 24BAI10235
# Course: Open Source Software | Chosen Software: Git
# Description: Checks if Git is installed and describes its
#              open-source philosophy using a case statement
# =============================================================

PACKAGE="git"

echo "===== FOSS Package Inspector ====="
echo "Checking package: $PACKAGE"
echo ""

# --- Check if the package is installed 
# Try RPM first, then dpkg, then fallback to command -v
if rpm -q $PACKAGE &>/dev/null; then
    echo "$PACKAGE is installed (RPM-based system)."
    echo ""
    rpm -qi $PACKAGE | grep -E 'Version|License|Summary'

elif dpkg -l $PACKAGE &>/dev/null 2>&1; then
    echo "$PACKAGE is installed (Debian-based system)."
    echo ""
    dpkg -l $PACKAGE | grep "^ii"

elif command -v git &>/dev/null; then
    echo "$PACKAGE is installed."
    echo "Version : $(git --version)"
    echo "License : GPL v2"
    echo "Summary : Distributed version control system"

else
    echo "$PACKAGE is NOT installed on this system."
    echo ""
    echo "To install:"
    echo "  Debian/Ubuntu : sudo apt install git"
    echo "  Fedora/RHEL   : sudo dnf install git"
fi

echo ""
echo "--------------------------------------------------"
echo "Philosophy Note (via case statement):"
echo "--------------------------------------------------"

# --- Case statement: print a philosophy note per package ---
case $PACKAGE in
    git)
        echo ">> Git: Born in 2005 out of frustration with proprietary tools."
        echo "   Linus Torvalds wrote Git in two weeks so no company could"
        echo "   ever hold the Linux kernel's version control hostage again."
        ;;
    httpd|apache2)
        echo ">> Apache: The web server that built the open internet."
        ;;
    mysql)
        echo ">> MySQL: Open source at the heart of millions of applications."
        ;;
    vlc)
        echo ">> VLC: Built by students in Paris who just wanted to stream freely."
        ;;
    python3|python)
        echo ">> Python: A language shaped entirely by community consensus."
        ;;
    firefox)
        echo ">> Firefox: A nonprofit's answer to the browser monoculture."
        ;;
    *)
        echo ">> $PACKAGE: An open-source tool built on the philosophy of sharing."
        ;;
esac