# BAS Guardian - Free Building Automation System (BAS) Security Scanner

**BAS Guardian** is a free, open-source cybersecurity scanning tool that helps facility managers, IT teams, and OT security professionals detect internet-exposed Building Automation Systems (BAS), BACnet devices, and HVAC/BMS controllers before attackers exploit them. Available in both **PowerShell** and **Bash**, BAS Guardian is built on real 2026 CISA ICS advisories and vendor-specific CVE intelligence from Honeywell, Johnson Controls, Siemens, and Tridium.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue.svg)](https://docs.microsoft.com/en-us/powershell/)
[![Bash](https://img.shields.io/badge/Bash-4.0%2B-green.svg)](https://www.gnu.org/software/bash/)
[![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Linux%20%7C%20macOS-lightgrey.svg)]()
[![Maintained](https://img.shields.io/badge/Maintained-Yes-brightgreen.svg)]()
[![GitHub issues](https://img.shields.io/github/issues/spinfosecurity/building_automation_system_guardian)](https://github.com/spinfosecurity/building_automation_system_guardian/issues)
[![GitHub last commit](https://img.shields.io/github/last-commit/spinfosecurity/building_automation_system_guardian)](https://github.com/spinfosecurity/building_automation_system_guardian/commits/main)
[![GitHub stars](https://img.shields.io/github/stars/spinfosecurity/building_automation_system_guardian?style=social)](https://github.com/spinfosecurity/building_automation_system_guardian/stargazers)

---

## Table of Contents

- [About](#about)
- [Why This Matters](#why-this-matters)
- [What This Tool Does](#what-this-tool-does)
- [Real-World Threat Intelligence](#real-world-threat-intelligence)
- [Key Features](#key-features)
- [Quick Start](#quick-start)
- [Sample Output](#sample-output)
- [What This Does NOT Do](#what-this-does-not-do)
- [Repository Structure](#repository-structure)
- [Documentation](#documentation)
- [Technical Specifications](#technical-specifications)
- [Contributing](#contributing)
- [Issues & Support](#issues--support)
- [References](#references)
- [License](#license)
- [Disclaimer](#disclaimer)

---

## About

Building Automation Systems (BAS) — the networks that control HVAC, access control, lighting, and building management — are increasingly targeted by cyber attackers due to weak or nonexistent authentication in legacy protocols like BACnet and LonWorks. In 2026, CISA published multiple critical Industrial Control Systems (ICS) advisories covering Honeywell, Johnson Controls, and Siemens building automation products, including a maximum-severity CVSS 10.0 vulnerability in Honeywell IQ4x controllers.

**BAS Guardian** gives facility operators, IT/OT teams, and cybersecurity consultants a fast, free way to identify these exact exposures on their own networks — without needing expensive commercial scanning tools or deep penetration testing expertise.

> 🔎 **Keywords:** building automation system security, BACnet vulnerability scanner, BMS cybersecurity tool, HVAC network security, Honeywell IQ4x vulnerability, Johnson Controls C-CURE security, Siemens Desigo CC security, Tridium Niagara scanner, CISA ICS advisory tool, OT security scanner, smart building cybersecurity, critical infrastructure protection

## Why This Matters

Smart buildings run on decades-old industrial protocols that were never designed with security in mind. A single exposed BACnet controller or unauthenticated HVAC dashboard can give an attacker a foothold into an entire facility network — and in 2026, CISA has confirmed active exploitation across multiple major BAS vendors.

- 🏢 **Critical infrastructure impact**: Hospitals, data centers, and government facilities rely on these systems
- 🔓 **Default-insecure by design**: BACnet has no native authentication or encryption
- 🚨 **CVSS 10.0 vulnerabilities exist today**: Honeywell IQ4x ships with authentication disabled out of the box
- 🆓 **Free alternative to commercial tools**: No licensing fees, no vendor lock-in

## What This Tool Does

- **Scans BAS subnets** for exposed BACnet devices, HVAC controllers, and BMS workstations
- **Detects primary attack vectors**: RDP (3389), VNC (5900), SSH (22)
- **Identifies BAS protocol exposure**: BACnet/IP (47808), BACnet/SC (4800), LonWorks (1628), Tridium Niagara Fox (1911/4911)
- **Fingerprints vendor-specific platforms**: Honeywell IQ4x, Johnson Controls C-CURE 9000/Victor, Siemens Desigo CC/SENTRON Powermanager
- **Flags critical vendor CVEs** including CVE-2026-3611 (CVSS 10.0) and CVE-2026-24060
- **Prioritizes findings by severity** (CRITICAL vs HIGH)
- **Generates simple text reports** for sharing with facilities and IT teams
- **Runs on Windows, Linux, and macOS** via matching PowerShell and Bash implementations

## Real-World Threat Intelligence

This tool is built directly on documented 2026 vulnerabilities and CISA advisories:

| Vendor / System | CVE / Advisory | Severity | Details |
|---|---|---|---|
| Honeywell IQ4x BMS Controller | CVE-2026-3611 | 🔴 CVSS 10.0 Critical | Ships with web HMI authentication **disabled by factory default**; full remote takeover possible |
| Johnson Controls C-CURE 9000 / Victor | ICSA-26-204-01 (Jul 23, 2026) | 🟠 High | Remote code execution via network access |
| Siemens Desigo CC / SENTRON Powermanager | CISA Advisory (Aug 2025) | 🟠 Medium-High | Least-privilege violation enabling privilege escalation |
| BACnet/IP Protocol | CVE-2026-24060 | 🔴 Critical | Unauthenticated attackers can view and modify BACnet service data |
| bacnet-stack | CVE-2026-41503 | 🟡 Medium | Out-of-bounds read in ReadPropertyMultiple decoder; patched in 1.4.3 |
| Tridium Niagara Framework | Historical + ongoing monitoring | ⚪ Variable | Widely embedded across multiple BMS vendor products |

## Key Features

### 🎯 Vendor-Specific Critical Alerts
BAS Guardian doesn't just scan generic ports — it fingerprints known vendor platforms and cross-references them against active 2026 CVEs, delivering actionable, vendor-specific remediation guidance instead of generic port-scan output.

### 📡 Protocol Coverage
| Protocol | Port(s) |
|---|---|
| BACnet/IP | 47808, 47809 |
| BACnet/SC (Secure Connect) | 4800 |
| LonWorks / LonTalk | 1628, 1629 |
| BACnet Broadcast Management Device (BBMD) | 47800 |
| Tridium Niagara Fox Protocol | 1911, 4911, 9998 |

## Quick Start

### PowerShell Version (Windows)
```powershell
.\scripts\powershell\BAS-Guardian.ps1
```

### Bash Version (Linux/macOS)
```bash
chmod +x scripts/bash/BAS-Guardian.sh
./scripts/bash/BAS-Guardian.sh
```

Both versions deliver identical scanning logic, vendor fingerprinting, and reporting — pick whichever matches your OS.

## Sample Output

