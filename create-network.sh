#!/bin/bash

# Create a custom bridge network for our DevSecOps pipeline
docker network create --driver bridge petclinic-devsecops-network

# Verify the network was created
docker network ls | grep petclinic-devsecops-network

# Display docker network details
docker network inspect petclinic-devsecops-network