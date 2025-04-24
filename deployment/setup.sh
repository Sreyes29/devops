#!/bin/bash
# Master setup script to handle deployment steps
set -e

echo "Starting PetClinic deployment process..."

# Install Java if not present
if ! command -v java &> /dev/null; then
    echo "Installing Java..."
    apt-get update
    apt-get install -y openjdk-17-jdk
    echo "Java installed successfully."
else
    echo "Java already installed, continuing."
fi

# Create application user if it doesn't exist
if ! id -u petclinic &>/dev/null; then
    echo "Creating petclinic user..."
    useradd -m -s /bin/bash petclinic
    echo "User created successfully."
else
    echo "User petclinic already exists, continuing."
fi

# Create application directory
echo "Setting up application directory..."
mkdir -p /opt/petclinic
cp petclinic.jar /opt/petclinic/
chown -R petclinic:petclinic /opt/petclinic
chmod 755 /opt/petclinic
chmod 500 /opt/petclinic/petclinic.jar

# Setup systemd service
echo "Setting up systemd service..."
cp petclinic.service /etc/systemd/system/
chmod 644 /etc/systemd/system/petclinic.service

# Reload systemd, enable and restart service
echo "Starting the application..."
systemctl daemon-reload
systemctl enable petclinic.service
systemctl restart petclinic.service

# Verify service status
echo "Checking service status..."
systemctl status petclinic.service --no-pager

echo "Deployment complete!"