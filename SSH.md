# How to access with SSH (No Password)

## 1. Generate SSH key

Run this on your **local machine**:

```bash
# Recommended: using ed25519 (faster and secure)
ssh-keygen -t ed25519 -C "your_email@example.com"

# OR using RSA 4096
ssh-keygen -t rsa -b 4096
```

_Press Enter to accept defaults. You don't need a passphrase for passwordless login._

## 2. Copy public key to remote machine

### For Linux / Mac / WSL

```bash
ssh-copy-id go@72.62.57.24
```

### For Windows (PowerShell)

Since `ssh-copy-id` is not available on Windows, use this command:

```powershell
# If using ed25519 (Recommended)
type $env:USERPROFILE\.ssh\id_ed25519.pub | ssh go@72.62.57.24 "mkdir -p .ssh && cat >> .ssh/authorized_keys"

# OR if using RSA
type $env:USERPROFILE\.ssh\id_rsa.pub | ssh go@72.62.57.24 "mkdir -p .ssh && cat >> .ssh/authorized_keys"
```

_Note: It will ask for your password one last time._

## 3. Connect to remote machine

```bash
ssh go@72.62.57.24
```

## 4. Confirm SSH key addition on remote machine

Once logged in, verify permissions (Crucial for security):

```bash
cd ~/.ssh
# Check permission for folder (should be drwx------ or 700)
ls -ld ~/.ssh

# Check permission for file (should be -rw------- or 600)
ls -l ~/.ssh/authorized_keys

# To view the keys
cat authorized_keys
```

## 5. Add another device

On the **new device**, simply repeat steps 1 and 2.
(Do not run this on the first device unless you want to generate a _new_ key pair).

## 6. Remove SSH key from remote machine

**WARNING:** Do not use `rm` unless you want to delete ALL keys.
To remove a specific key:

```bash
nano ~/.ssh/authorized_keys
# Delete the line corresponding to the key you want to remove, then Ctrl+X, Y, Enter.
```

## 7. Disable password authentication (Security Hardening)

This forces key-only authentication.

```bash
sudo nano /etc/ssh/sshd_config
```

Find and edit these lines:

```text
PasswordAuthentication no
PubkeyAuthentication yes
ChallengeResponseAuthentication no
```

## 8. Restart SSH service

```bash
sudo systemctl restart sshd
```
