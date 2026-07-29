# ♟️ WEEK 2: ENTERPRISE NETWORK TOPOLOGY & IRONCLAD VPC ARCHITECTURE

> *“A fortress without walls is merely open ground.”* Designing an isolated, highly secure Virtual Private Cloud (VPC) with strict subnet segmentation, route tables, and ironclad perimeter gates.

---

## 🏛️ The Scorpio-Saturn Network Matrix

| Network Layer | Ironclad Operational Objective | Security Protocol & Standard |
| :--- | :--- | :--- |
| **01. External Edge** | Control and inspect all inbound traffic | Internet Gateway (IGW) / Public Subnet |
| **02. Transit Control** | Route and filter inter-subnet communication | Custom Route Tables & NACLs |
| **03. Abyssal Core** | Isolate critical backend databases and APIs | Private Subnet / Zero Public Exposure |

---

## ⚡ Core System Architecture Flow

| Step | Operation Phase | Action & Protocol |
| :--- | :--- | :--- |
| **Phase A** | Entry | External requests hit the Internet Gateway (`10.0.0.0/16`) |
| **Phase B** | Screening | Public Subnet (`10.0.1.0/24`) processes edge routing |
| **Phase C** | Containment | Internal Private Subnet (`10.0.2.0/24`) safely executes core logic |

---

## 🛠️ Execution Verification Checklist
- [x] VPC CIDR block configured to `10.0.0.0/16`
- [x] Public and Private subnets completely decoupled
- [x] Route tables and internet gateway associations hardened