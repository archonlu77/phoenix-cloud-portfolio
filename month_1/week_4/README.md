# 🔥 Phoenix Fortress: Month 1 Infrastructure & Security Suite

> A production-grade enterprise network topology, automated Infrastructure-as-Code provisioning suite, and secure Nginx API gateway architecture built from scratch.

---

## 🗺️ Architectural Overview

```mermaid
flowchart TD
    classDef w1 fill:#FFCDD2,stroke:#B71C1C,stroke-width:2px,color:#B71C1C;
    classDef w2 fill:#FFE0B2,stroke:#E65100,stroke-width:2px,color:#E65100;
    classDef w3 fill:#FFF9C4,stroke:#F57F17,stroke-width:2px,color:#F57F17;
    classDef w4 fill:#C8E6C9,stroke:#1B5E20,stroke-width:2px,color:#1B5E20;
    classDef client fill:#E1BEE7,stroke:#4A148C,stroke-width:2px,color:#4A148C;

    subgraph ClientLayer ["🌍 External Client Layer"]
        Client([Clients / Internet Users])
	class CLient client

    subgraph W4 ["🟢 Week 4: Edge Gateway & Security"]
        Nginx[Nginx API Gateway <br/> setup_api_nginx.sh]:::w4
        Service5000[Core API Service <br/> Port 5000]:::w4
        Service7000[Dashboard Service <br/> Port 7000]:::w4
        Audit[Perimeter Watchtower <br/> audit_firewall.sh]:::w4
        Master[Master Orchestration <br/> master_drill.sh]:::w4
    end

    Client -->|HTTP / HTTPS Request| Nginx
    Nginx -->|Reverse Proxy| Service5000
    Nginx -->|Reverse Proxy| Service7000
    
    Master -->|Validates Blueprints| Nginx
    Master -->|Executes Sweep| Audit
    Audit -->|Scans TCP/UDP Ports| Ports[(Active Listeners)]
