# Container Communication Protocols

This document defines the communication protocols between containers in the DevSecOps pipeline for the Spring PetClinic application.

## Network Overview

The Docker network `petclinic-devsecops-network` is a custom bridge network that enables containers to communicate with each other using their service names as hostnames.

## Service Communication Matrix

| Service     | Initiates Communication To                      | Protocol | Ports       |
|-------------|------------------------------------------------|----------|-------------|
| Jenkins     | petclinic, sonarqube, zap, prometheus          | HTTP/S   | Various     |
| SonarQube   | sonarqube-db                                   | JDBC     | 5432        |
| OWASP ZAP   | petclinic                                      | HTTP     | 8080        |
| Prometheus  | jenkins, sonarqube, petclinic, grafana         | HTTP     | Various     |
| Grafana     | prometheus                                     | HTTP     | 9090        |
| PetClinic   | None (doesn't initiate connections to CI/CD)   | N/A      | N/A         |

## Protocol Details

### Jenkins Communication

- **With PetClinic**: 
  - Pulls code from repository
  - Builds and tests application
  - Deploys application via Ansible
  - Port: 8080 (PetClinic application)

- **With SonarQube**:
  - Sends code for static analysis
  - Retrieves analysis results
  - Port: 9000

- **With OWASP ZAP**:
  - Triggers security scans
  - Retrieves scan results
  - Port: 8090

- **With Prometheus**:
  - Exposes metrics via /prometheus endpoint
  - Port: 8080 (Jenkins), 9090 (Prometheus)

### SonarQube Communication

- **With Database**:
  - Stores and retrieves analysis data
  - Protocol: JDBC
  - Port: 5432

### Prometheus Communication

- **With All Services**:
  - Scrapes metrics at regular intervals
  - HTTP protocol
  - Endpoints: 
    - Jenkins: /prometheus
    - SonarQube: Built-in metrics endpoint
    - PetClinic: /actuator/prometheus

### OWASP ZAP Communication

- **With PetClinic**:
  - Performs security scanning
  - HTTP protocol
  - Port: 8080

## Security Considerations

1. All inter-container communication stays within the Docker network
2. Only required ports are exposed to the host
3. Services only communicate with other services as needed
4. Authentication is required for service-to-service communication where supported
5. Jenkins is the primary orchestrator for pipeline activities

## Monitoring Communication

Prometheus monitors all services and Grafana visualizes the metrics. This provides visibility into the health and performance of the entire pipeline.