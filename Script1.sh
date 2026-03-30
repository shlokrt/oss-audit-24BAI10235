#!/bin/bash
# =============================================================
# Script 1: System Identity Report
# Author: Shlok Khanna | Roll No.: 24BAI10235
# Course: Open Source Software | Chosen Software: Git
# Description: Displays system information like a welcome screen
# =============================================================

# Variables
STUDENT_NAME="Shlok Khanna"
SOFTWARE_CHOICE="Git"

# Gather system information using command substitution $()
KERNEL=$(uname -r)
USER_NAME=$(whoami)
UPTIME=$(uptime -p)
DATE=$(date '+%A, %d %B %Y %H:%M:%S')

# Detect Linux distribution from the standard os-release file
if [ -f /etc/os-release ]; then
    DISTRO=$(grep -w "PRETTY_NAME" /etc/os-release | cut -d= -f2 | tr -d '"')
else
    DISTRO="Unknown Distribution"
fi

# Display the welcome screen 
echo "=================================================="
echo "   Open Source Audit — $STUDENT_NAME"
echo "   Chosen Software: $SOFTWARE_CHOICE"
echo "=================================================="
echo ""
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  Logged in as : $USER_NAME"
echo "  Home Dir     : $HOME"
echo "  Uptime       : $UPTIME"
echo "  Date & Time  : $DATE"
echo ""
echo "--------------------------------------------------"
echo "  OS License Note:"
echo "  The Linux kernel is licensed under the GNU"
echo "  General Public License v2 (GPL v2). This means"
echo "  anyone is free to use, study, modify, and share"
echo "  the source code — but modified versions must"
echo "  also remain open source (copyleft principle)."
echo "--------------------------------------------------"