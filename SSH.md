
# how acces with ssh no password
##  generate ssh key
```bash
# generate ssh key in your local machine
ssh-keygen -t rsa -b 4096

Your identification has been saved in /home/hussin/.ssh/id_rsa
Your public key has been saved in /home/hussin/.ssh/id_rsa.pub
```

copy public key to remote machine
```bash
# copy public key to remote machine
ssh-copy-id go@72.62.57.24
```

## connect to remote machine
```bash
# connect to remote machine
ssh go@72.62.57.24
```

## confiarm ssh key add im remote machine
```bash
cd ~/.ssh
cat authorized_keys
# check ssh key
ls -al ~/.ssh 
# check ssh key permission 
ls -ld ~/.ssh
ls -l ~/.ssh/authorized_keys
## permission should be 700 for ~/.ssh and 600 for ~/.ssh/authorized_keys
drwx------ 2 go go 4096 Dec  7 10:48 /home/go/.ssh
-rw------- 1 go go 860 Dec  7 10:48 /home/go/.ssh/authorized_keys
```

## add another device or re generate public key 

```bash
ssh-keygen -t rsa -b 4096
ssh-copy-id go@72.62.57.24
```

## remove ssh key from remote machine
```bash
ssh go@72.62.57.24
rm ~/.ssh/authorized_keys
```

## disable password authentication and enable public key authentication
```bash
sudo nano /etc/ssh/sshd_config
PasswordAuthentication no
PubkeyAuthentication yes
```

## restart ssh service
```bash
sudo systemctl restart sshd
```
