# OSS Audit — Git
### Open Source Software Capstone Project | VIT

**Student:** Shlok Khanna <br>
**Roll Number:** 24BAI10235 <br>
**Course:** Open Source Software (NGMC) <br>
**Software Choosen:** Git <br>
**License:** GPL v2  <br>

---

## What is this?

This is my capstone project for the Open Source Software course. I chose Git as my software because it's what I use on my day to day basis and it't the most interesting topic for me, the origin story of how Linus Torvalds built it in ten days after a company pulled the rug out from under the Linux kernel team is something worth exploring.


---

## The Scripts

There are five scripts in this repo. Here's what each one does and how to run it.

---

### Script 1 — System Identity Report
**File:** `Script1.sh`

Prints a welcome screen showing your Linux distro, kernel version, logged-in user, home directory, uptime, and current date. Also prints a note about the GPL v2 license that covers the Linux OS.

```bash
chmod +x Script1.sh
./Script1.sh
```

No arguments needed — just run it.

---

### Script 2 — FOSS Package Inspector
**File:** `Script2.sh`

Checks whether Git is installed on the system, finds the version and license info, and prints a short philosophy note using a case statement. Works on both RPM-based systems (Fedora, RHEL) and Debian-based systems (Ubuntu).

```bash
chmod +x Script2.sh
./Script2.sh
```

No arguments needed.

---

### Script 3 — Disk and Permission Auditor
**File:** `Script3.sh`

Loops through a list of important system directories (/etc, /var/log, /home, /usr/bin, /tmp) and reports the permissions, owner, and disk usage of each one. Also specifically checks whether Git's config files exist and what permissions they have.

```bash
chmod +x Script3.sh
./Script3.sh
```

No arguments needed.

---

### Script 4 — Log File Analyzer
**File:** `Script4.sh`

Reads a log file line by line and counts how many lines contain a keyword. Prints a summary and shows the last 5 matching lines. If you don't pass a keyword it defaults to searching for "error". If the file is empty it asks you for a different one instead of just crashing.

```bash
chmod +x Script4.sh

# Basic usage
./Script4.sh /var/log/syslog error

# With a different keyword
./Script4.sh /var/log/syslog warning

# If you don't have a system log handy, create a test one first
cat > ~/test.log << EOF
[2025-01-01 10:02:30] ERROR: Failed to connect to remote repository
[2025-01-01 10:05:22] ERROR: Permission denied on /etc/gitconfig
[2025-01-01 10:07:44] INFO: User configuration loaded
[2025-01-01 10:10:15] ERROR: Push rejected by remote server
[2025-01-01 10:13:40] WARNING: Large file detected in staging area
EOF

./Script4.sh ~/test.log error
```

**Arguments:**
- `$1` — path to the log file (required)
- `$2` — keyword to search for (optional, defaults to "error")

---

### Script 5 — Open Source Manifesto Generator
**File:** `Script5.sh`

Asks you three questions about your relationship with open source, then uses your answers to write a short personal manifesto and saves it to a text file called `manifesto_<yourusername>.txt`. Nothing fancy — just a fun way to make you think about what open source actually means to you.

```bash
chmod +x Script5.sh
./Script5.sh
```

It will ask you three questions interactively. Answer them and it generates the file.

---

## How to run all scripts at once

If you want to make all of them executable in one go:

```bash
chmod +x Script1.sh Script2.sh Script3.sh Script4.sh Script5.sh
```

---

## Dependencies

All scripts use standard tools that come pre-installed on any Linux system. The only actual dependency is Git itself, which Script 2 checks for.

| Tool | Used in | Notes |
|------|---------|-------|
| git | Script 2 | Install: `sudo apt install git` |
| uname, whoami, uptime, date | Scripts 1, 5 | Pre-installed on all Linux |
| ls, du, awk, cut | Script 3 | Pre-installed on all Linux |
| grep, tail | Script 4 | Pre-installed on all Linux |
| rpm or dpkg | Script 2 | Depends on your distro |

Tested on Ubuntu 22.04. Should work fine on any Debian-based system and most RPM-based ones too.

---

## Repository Structure

```
oss-audit-24BAI10235/
├── README.md
├── Script1.sh
├── Script2.sh
├── Script3.sh
├── Script4.sh
└── Script5.sh
```

The project report PDF is submitted separately on the VITyarthi portal.

---

## A quick note

I picked Git for this project because it felt like the most interesting choice for me it's a tool I actually use on a daily basis, and the story behind it is genuinely worth exploring. The fact that it was written in ten days out of frustration with a proprietary company, and then released for free so nobody could ever do the same thing again, says something real about why open source matters. That's what the report is about.

## License

This project uses GNU GPL v3.0 license.
