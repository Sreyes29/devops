# 🔐 SSH Access to Azure VMs

This repo provisions two Ubuntu VMs on Azure:
- One for **DevSecOps tools** (e.g., Jenkins, SonarQube, ZAP)
- One for **Production deployment** (e.g., Spring PetClinic)

You’ve been provided:
- The public IPs of both VMs
- The shared SSH key pair (`id_rsa`, `id_rsa.pub`) located in the `iac/` directory

---

## 📁 Step 1: Copy SSH Keys to Your Local Machine

Before you SSH into the VMs, copy the provided keys to your local `~/.ssh` directory:

```bash
mkdir -p ~/.ssh

# Copy the keys from the repo to your local .ssh folder
cp iac/id_rsa ~/.ssh/id_rsa
cp iac/id_rsa.pub ~/.ssh/id_rsa.pub

# Set correct permissions (required for SSH)
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
```

## 🖥️ Step 2: SSH Into the VMs

Open your terminal and run the following commands using the IPs provided to you.

### 🔹 SSH into the DevSecOps VM
```bash
ssh -i ~/.ssh/id_rsa azureuser@<DEVSECOPS_VM_IP>
```
### 🔹 SSH into the Production VM

```bash
ssh -i ~/.ssh/id_rsa azureuser@<PROD_VM_IP>
```