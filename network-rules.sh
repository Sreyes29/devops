#!/bin/bash

# This script sets up network connectivity rules for the DevSecOps pipeline
echo "Setting up network connectivity rules for DevSecOps pipeline..."

# Ensure Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker first."
    exit 1
fi

# Check if the network exists
if ! docker network ls | grep -q petclinic-devsecops-network; then
    echo "Network doesn't exist. Creating petclinic-devsecops-network..."
    docker network create --driver bridge petclinic-devsecops-network
fi

# Apply security rules - these would typically be implemented with 
# more sophisticated tools in production (e.g., firewall rules, security groups)
echo "Applying network security rules..."

# Define allowed service-to-service communications
# In a real-world scenario, this would be more granular and implemented
# with proper network security tools

# Sample rule setup (conceptual)
echo "- Jenkins -> All services: Allowed"
echo "- SonarQube -> PostgreSQL: Allowed"
echo "- SonarQube -> Jenkins: Allowed"
echo "- ZAP -> PetClinic: Allowed"
echo "- Prometheus -> All services: Allowed (metrics ports only)"
echo "- Grafana -> Prometheus: Allowed"
echo "- PetClinic -> CI/CD tools: Blocked"

echo "Network connectivity rules have been configured (conceptually)."