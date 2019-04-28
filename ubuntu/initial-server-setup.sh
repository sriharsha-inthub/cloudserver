 #!/bin/bash

 echo "Initial server setup.."
 echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
 echo "[Step 1] - Logging in as Roo"
 echo "ssh -i path/to/privatekey/ root@your_server_ip"
 echo ""
 echo "[Step 2] — Creating a New User"
 adduser sri --gecos "Sriharsha Vedurada,,," --disabled-password
 echo ""
 echo "[Step 3] — Granting Administrative Privileges"
 usermod -aG sudo sri
 echo ""
 echo "[Step 4] —Setting Up a Basic Firewall"
 ufw app list
 ufw allow OpenSSH
 ufw enable
 ufw status
 echo ""
 echo "Step 5 — Enabling External Access for Your Regular User"
 rsync --archive --chown=sri:sri ~/.ssh /home/sri
 echo "################# Completed #################"
 
 