# BAS Guardian - Free Building Automation System (BAS) Security Scanner

**BAS Guardian** is a free, open-source cybersecurity scanning tool that helps facility managers, IT teams, and OT security professionals detect internet-exposed Building Automation Systems (BAS), BACnet devices, and HVAC/BMS controllers before attackers exploit them. Available in both **PowerShell** and **Bash**, BAS Guardian is built on real 2026 CISA ICS advisories and vendor-specific CVE intelligence from Honeywell, Johnson Controls, Siemens, and Tridium.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue.svg)](https://docs.microsoft.com/en-us/powershell/)
[![Bash](https://img.shields.io/badge/Bash-4.0%2B-green.svg)](https://www.gnu.org/software/bash/)
[![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Linux%20%7C%20macOS-lightgrey.svg)]()
[![CISA Aligned](https://img.shields.io/badge/CISA-ICS%20Advisories%20Aligned-red)](#)
[![CVE-2026-3611](https://img.shields.io/badge/CVE--2026--3611-CVSS%2010.0-critical)](#)
[![Maintained](https://img.shields.io/badge/Maintained-Yes-brightgreen.svg)]()
[![GitHub issues](https://img.shields.io/github/issues/spinfosecurity/BAS-Guardian)](https://github.com/spinfosecurity/BAS-Guardian/issues)
[![GitHub last commit](https://img.shields.io/github/last-commit/spinfosecurity/BAS-Guardian)](https://github.com/spinfosecurity/BAS-Guardian/commits/main)
[![GitHub stars](https://img.shields.io/github/stars/spinfosecurity/BAS-Guardian?style=social)](https://github.com/spinfosecurity/BAS-Guardian/stargazers)

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
- [FAQ](#faq)
- [Who This Is For](#who-this-is-for)
- [Documentation](#documentation)
- [Technical Specifications](#technical-specifications)
- [Contributing](#contributing)
- [Issues & Support](#issues--support)
- [Support This Project](#support-this-project)
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
- **Generates simple text/CSV reports** for sharing with facilities and IT teams
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

```text
[2026-08-03 21:14:02] [CRITICAL] 10.0.5.42:47808  BACnet/IP exposed — Honeywell IQ4x fingerprint detected (CVE-2026-3611, CVSS 10.0)
[2026-08-03 21:14:05] [HIGH]     10.0.5.55:1911   Tridium Niagara Fox protocol reachable
[2026-08-03 21:14:07] [HIGH]     10.0.5.61:3389   RDP exposed on BAS subnet — restrict remote access immediately
[2026-08-03 21:14:09] [MEDIUM]   10.0.5.70:22     SSH reachable — review access policy

Scan complete. Findings: 4 (1 CRITICAL, 2 HIGH, 1 MEDIUM)
Report saved: ./reports/BAS-Guardian-20260803-211409.csv
```

## What This Does NOT Do

- ❌ **Does NOT exploit vulnerabilities** — detection and reporting only
- ❌ **Does NOT modify BAS device configurations** — scans are read-only and non-intrusive
- ❌ **Does NOT replace professional BAS security assessments**
- ❌ **Does NOT guarantee compliance** with ASHRAE 135, NIST CSF, or any regulatory framework

## Repository Structure

```
BAS-Guardian/
├── README.md
├── LICENSE
├── CONTRIBUTING.md
├── SECURITY.md
├── reports/
├── scripts/
│   ├── powershell/
│   │   └── BAS-Guardian.ps1
│   └── bash/
│       └── BAS-Guardian.sh
└── docs/
```

---

## FAQ

**Q: Does BAS Guardian require admin/root privileges?**  
A: No. It uses standard TCP connections only. No raw sockets required.

**Q: Can I run this without coordinating with building operations?**  
A: No. BACnet scanning can disrupt active controllers. Always coordinate with your facilities team and obtain written authorization before scanning any production BAS network.

**Q: Does it exploit CVE-2026-3611?**  
A: No. It detects whether the Honeywell IQ4x BACnet port is reachable. It does not attempt authentication bypass or exploit any vulnerability.

**Q: Can I export results to a CMMS or work order system?**  
A: Yes. CSV output can be imported into Maximo, ServiceNow Facilities, or any CMMS that accepts CSV. JSON output is available for SIEM ingestion.

**Q: Is this useful for data center or hospital facility teams?**  
A: Yes — any environment running BACnet, Tridium Niagara, or similar BMS protocols is in scope.

**Q: Is it free for commercial facility management use?**  
A: Yes — MIT License.

---

## Who This Is For

- **Facility managers and building engineers** responsible for HVAC/BMS cybersecurity
- **Hospital and healthcare IT/OT teams** managing critical building infrastructure
- **Data center operations teams** securing BMS and cooling systems
- **Government and federal facility security officers** (FSOs)
- **ICS/OT security consultants** adding BAS assessments to their service portfolio
- **Smart building integrators** validating security posture of new BAS deployments

---

## Documentation

Detailed documentation for scan modes, vendor fingerprinting, and report formats will be added to the `docs/` folder in future releases.

## Technical Specifications

- **Supported OS**: Windows 10/11, Linux, macOS
- **PowerShell**: 5.1+ or 7.0+ (Core)
- **Bash**: 4.0+
- **Network Requirements**: Access to BAS subnet (typically a separate VLAN)
- **Privileges**: Standard user; no elevation required for basic scanning

## Contributing

Contributions are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines. For security issues in the tool itself, see [SECURITY.md](./SECURITY.md).

## Issues & Support

Found a bug? [Open an issue](https://github.com/spinfosecurity/BAS-Guardian/issues). For security vulnerabilities in this tool, see [SECURITY.md](./SECURITY.md).

---

## ⭐ Support This Project

If BAS Guardian helped you find a real exposure in your building infrastructure, consider:

- ⭐ **Starring this repo** — it helps other facility security teams find it
- 🐛 **Opening an issue** if you find a bug or want a new vendor/CVE added
- 🤝 **Contributing** — see [CONTRIBUTING.md](./CONTRIBUTING.md)
- 💬 **Sharing** with your facilities team, building integrator, or OT security network

> Built by [@spinfosecurity](https://github.com/spinfosecurity) — learning by building free tools that detect and protect critical infrastructure.

---

## References

- CISA ICS Advisories: [https://www.cisa.gov/ics](https://www.cisa.gov/ics)
- ASHRAE Standard 135 (BACnet): [https://www.ashrae.org/standards-research--technology/standards--guidelines/titles-purposes-and-scopes/ashrae-standing-standard-project-committee-135](https://www.ashrae.org/)
- Tridium Niagara Security: [https://www.tridium.com/us/en/support/cybersecurity](https://www.tridium.com/)
- [Security Policy](./SECURITY.md)

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

## Disclaimer

This tool is provided for **defensive, authorized security testing only**. Users must have explicit written permission from building owners and facility operators before scanning any network. The authors assume no liability for misuse, service disruption, or compliance gaps. BAS networks are sensitive — coordinate with your facilities team before running any scans.
