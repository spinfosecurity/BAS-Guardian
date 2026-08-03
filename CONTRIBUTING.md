# Contributing to BAS Guardian

Thank you for your interest in contributing to BAS Guardian!

## How to Contribute

### Reporting Bugs
Open an issue with steps to reproduce, expected vs actual behavior, and environment details.

### Suggesting New Vendor CVEs
If you know of a BAS/BMS vendor vulnerability not yet covered (Honeywell, Johnson Controls, Siemens, Tridium, Schneider, etc.), please open an issue with:
- CVE ID or CISA advisory number
- Affected product/version
- Port(s) associated with the vulnerable service

### Pull Requests
1. Fork the repository
2. Create a feature branch (git checkout -b feature/amazing-feature)
3. Make your changes and test on your target platform
4. Commit with clear messages
5. Push and open a Pull Request

### Code Standards

PowerShell: Use approved verbs, comment-based help, parameter validation.
Bash: Use ShellCheck, follow Google Shell Style Guide, use set -euo pipefail.

## Development Setup

```bash
git clone https://github.com/spinfosecurity/building_automation_system_guardian.git
cd building_automation_system_guardian
chmod +x scripts/bash/BAS-Guardian.sh
./scripts/bash/BAS-Guardian.sh
```
