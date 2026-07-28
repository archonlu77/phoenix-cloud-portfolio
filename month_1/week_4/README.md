```mermaid
flowchart TD
    subgraph ClientLayer ["🌍 External Client Layer"]
        Client([Clients / Internet Users])
    end

    subgraph W4 ["🟢 Week 4: Edge Gateway & Security"]
        Nginx[Nginx API Gateway <br/> setup_api_nginx.sh]
        Service5000[Core API Service <br/> Port 5000]
        Service7000[Dashboard Service <br/> Port 7000]
        Audit[Perimeter Watchtower <br/> audit_firewall.sh]
        Master[Master Orchestration <br/> master_drill.sh]
    end

    Client -->|HTTP / HTTPS Request| Nginx
    Nginx -->|Reverse Proxy| Service5000
    Nginx -->|Reverse Proxy| Service7000
    
    Master -->|Validates Blueprints| Nginx
    Master -->|Executes Sweep| Audit
    Audit -->|Scans TCP/UDP Ports| Ports[(Active Listeners)]

    style Client fill:#E1BEE7,stroke:#4A148C,stroke-width:2px,color:#4A148C
    style Nginx fill:#C8E6C9,stroke:#1B5E20,stroke-width:2px,color:#1B5E20
    style Service5000 fill:#C8E6C9,stroke:#1B5E20,stroke-width:2px,color:#1B5E20
    style Service7000 fill:#C8E6C9,stroke:#1B5E20,stroke-width:2px,color:#1B5E20
    style Audit fill:#C8E6C9,stroke:#1B5E20,stroke-width:2px,color:#1B5E20
    style Master fill:#C8E6C9,stroke:#1B5E20,stroke-width:2px,color:#1B5E20O
