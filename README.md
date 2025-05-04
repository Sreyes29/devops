# DevSecOps Pipeline for Spring PetClinic

This project sets up a **DevSecOps pipeline** for the [Spring PetClinic](https://github.com/spring-projects/spring-petclinic) application using containerized tools and automated deployment.

The pipeline incorporates:

- **Jenkins** for continuous integration
- **SonarQube** for static code analysis
- **OWASP ZAP** for security scanning
- **Prometheus** and **Grafana** for monitoring and visualization
- **Ansible** for automated deployment to a production virtual machine

All tools run in Docker containers connected via a custom network. The pipeline is triggered by source code changes in a GitHub repository and automatically builds, tests, analyzes, scans, and deploys the updated application to a remote VM.

This setup demonstrates secure, automated software delivery with real-time monitoring and reporting.
