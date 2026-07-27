# Week 4 - Day 4: Perimeter Defense & Least Privilege Log

## Objectives
1. Enforce strict firewall rules and port restrictions.
2. Validate internal API routing isolation.
3. Audit security group configurations.

## Execution Log
- [x] Workspace verified
- [ ] Firewall port audit initiated
- [ ] Inbound/Outbound least privilege rules applied

## Audit Findings (Day 4)
- Ran refined internet port scan (`netstat -an -p tcp | grep LISTEN`).
- Verified active TCP listeners on local interface and application ports (`5000`, `7000`, ephemeral ports).
- Status: **Perimeter reviewed and documented.**
