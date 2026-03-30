#!/bin/bash
# =============================================================
# Script 5: The Open Source Manifesto Generator
# Author: Shlok Khanna | Roll No.: 24BAI10235
# Course: Open Source Software | Chosen Software: Git
# Description: Asks three questions interactively and generates
#              a personalised open source philosophy statement
#              saved to a .txt file
# =============================================================

# --- Alias concept (works in interactive shell sessions) ---
# alias today='date "+%d %B %Y"'
# Here we use date directly since aliases don't work in scripts

echo "=================================================="
echo "   The Open Source Manifesto Generator"
echo "=================================================="
echo ""
echo "Answer three questions to generate your manifesto."
echo ""

# --- read -p displays a prompt and captures user input ---
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

echo ""

# --- Get current date and build output filename ---
DATE=$(date '+%d %B %Y')
OUTPUT="manifesto_$(whoami).txt"

# --- Grouped command block: write entire manifesto to file ---
# > creates/clears the file; all echo output goes into it
{
    echo "=================================================="
    echo "   MY OPEN SOURCE MANIFESTO"
    echo "   Generated on: $DATE"
    echo "   By: $(whoami)"
    echo "=================================================="
    echo ""
    # String interpolation: variables embedded into text
    echo "Every day, I rely on $TOOL — a tool I did not pay for,"
    echo "did not create, yet one handed to me freely by people"
    echo "I have never met. To me, freedom means $FREEDOM."
    echo ""
    echo "That word is at the heart of why open source matters:"
    echo "not just as a way to write software, but as a statement"
    echo "about how knowledge should move through the world."
    echo ""
    echo "If I could build anything, I would build $BUILD —"
    echo "and I would share every line of it freely."
    echo ""
    echo "   — $(whoami), $DATE"
    echo "=================================================="
} > "$OUTPUT"

echo "Manifesto saved to: $OUTPUT"
echo ""
cat "$OUTPUT"

