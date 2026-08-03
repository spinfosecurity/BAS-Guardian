# BAS Guardian - Building Automation System Security Scanner

**BAS Guardian** is a free, open-source cybersecurity scanning tool built to help facility managers, IT teams, and OT security professionals detect internet-exposed Building Automation Systems (BAS), BACnet devices, and HVAC/BMS controllers before attackers exploit them. Available in both **PowerShell** and **Bash**, BAS Guardian applies real-world 2026 CISA ICS advisories and vendor-specific CVE intelligence from Honeywell, Johnson Controls, Siemens, and Tridium.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue.svg)](https://docs.microsoft.com/en-us/powershell/)
[![Bash](https://img.shields.io/badge/Bash-4.0%2B-green.svg)](https://www.gnu.org/software/bash/)
[![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Linux%20%7C%20macOS-lightgrey.svg)]()

## Table of Contents
- [About](#about)
- [What This Tool Does](#what-this-tool-does)
- [Real-World Threat Intelligence](#real-world-threat-intelligence)
- [Key Features](#key-features)
- [Quick Start](#quick-start)
- [What This Does NOT Do](#what-this-does-not-do)
- [Documentation](#documentation)
- [Technical Specifications](#technical-specifications)
- [Contributing](#contributing)
- [License](#license)

## About

Building Automation Systems (BAS) — the networks controlling HVAC, access control, lighting, and building management — are increasingly targeted by cyber attackers due to weak or nonexistent authentication in legacy protocols like BACnet and LonWorks. In 2026, CISA published multiple critical ICS advisories covering Honeywell, Johnson Controls, and Siemens building automation products, including a maximum-severity CVSS 10.0 vulnerability in Honeywell IQ4x controllers.

**BAS Guardian** was built to give facility operators, IT/OT teams, and cybersecurity consultants a fast, free way to identify these exact exposures on their own networks — without expensive commercial scanning tools.

**Keywords:** building automation system security, BACnet vulnerability scanner, BMS cybersecurity tool, HVAC network security, Honeywell IQ4x vulnerability, Johnson Controls C-CURE security, Siemens Desigo CC security, Tridium Niagara scanner, CISA ICS advisory tool, OT security scanner, smart building cybersecurity

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

This tool is built directly on documented 2026 vulnerabilities and advisories:

| Vendor/System | CVE / Advisory | Severity | Details |
|---|---|---|---|
| Honeywell IQ4x BMS Controller | CVE-2026-3611 | CVSS 10.0 Critical | Ships with web HMI authentication **disabled by factory default**; full remote takeover possible |
| Johnson Controls C-CURE 9000 / Victor | ICSA-26-204-01 (July 23, 2026) | High | Remote code execution via network access |
| Siemens Desigo CC / SENTRON Powermanager | CISA Advisory (Aug 2025) | Medium-High | Least-privilege violation enabling privilege escalation |
| BACnet/IP Protocol | CVE-2026-24060 | Critical | Unauthenticated attackers can view and modify BACnet service data |
| bacnet-stack | CVE-2026-41503 | Medium | Out-of-bounds read in ReadPropertyMultiple decoder; patched in 1.4.3 |
| Tridium Niagara Framework | Historical + ongoing monitoring | Variable | Widely embedded across multiple BMS vendor products |

## Key Features

### Vendor-Specific Critical Alerts
BAS Guardian doesn't just scan generic ports — it fingerprints known vendor platforms and cross-references them against active 2026 CVEs, giving you actionable, vendor-specific remediation guidance instead of generic port-scan output.

### Protocol Coverage
- BACnet/IP (47808, 47809)
- BACnet/SC — Secure Connect (4800)
- LonWorks/LonTalk (1628, 1629)
- BACnet Broadcast Management Device — BBMD (47800)
- Tridium Niagara Fox Protocol (1911, 4911, 9998)

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

Both versions deliver identical scanning logic, vendor fingerprinting, and reporting.

## What This Does NOT Do

- Does NOT test credentials or attempt authentication
- Does NOT modify HVAC/BMS configurations
- Does NOT replace professional penetration testing
- Does NOT decrypt BACnet/SC traffic
- Does NOT work over IPv6 (IPv4 only)
- Does NOT scan non-/24 subnets

## Documentation

- [PowerShell Guide](scripts/powershell/README.md)
- [Bash Guide](scripts/bash/README.md)
- [CISA Reference](docs/CISA-Reference.md)
- [Threat Intelligence](docs/Threat-Intelligence.md)

## Technical Specifications

### Supported Platforms
| Platform | Script | Requirements |
|---|---|---|
| Windows | PowerShell (`BAS-Guardian.ps1`) | PowerShell 5.1+, .NET Framework 4.7+ |
| Linux | Bash (`BAS-Guardian.sh`) | Bash 4.0+, standard utilities |
| macOS | Bash (`BAS-Guardian.sh`) | Bash 4.0+, standard utilities |

### Limitations
- TCP port scan only (no UDP, no banner grabbing)
- Single-threaded (~2-5 minutes per /24 subnet)
- May produce false negatives behind aggressive firewalls
- Requires local network access to the BAS subnet being scanned

## Sample Output

```
[!!! VENDOR CRITICAL !!!] 192.168.30.45:5489 - Honeywell
    CVE-2026-3611 (CVSS: 10.0 CRITICAL)
    IQ4x BMS Controller ships with web HMI authentication disabled by factory default
    Action: IMMEDIATELY enable authentication; verify not internet-facing

[HIGH] 192.168.30.12:47808 - BACnet/IP - Unauthenticated protocol
    Action: Remove from internet; segment from IT network
```

## Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) first.

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Issues & Support

- **Bug Reports / Feature Requests**: [Open an issue](https://github.com/spinfosecurity/building_automation_system_guardian/issues)
- **Security Issues**: Please report privately to security@spinfosecurity.com

## References

- [CISA ICS Advisories](https://www.cisa.gov/news-events/cybersecurity-advisories)
- [CVE-2026-3611 - NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-3611)
- [CVE-2026-24060 Details](https://www.cisa.gov)
- [Johnson Controls Product Security Advisories](https://www.johnsoncontrols.com/cyber-solutions/cyber-updates)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Disclaimer

This tool is for **defensive security assessment by authorized personnel only**. Only scan networks you own or have explicit written permission to test. Unauthorized scanning may violate federal and state laws, including the Computer Fraud and Abuse Act (CFAA).

---

**BAS Guardian** - Protecting building automation from cyber threats, one scan at a time.

Made by [spinfosecurity](https://github.com/spinfosecurity)
