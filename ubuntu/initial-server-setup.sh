 #!/bin/bash

 echo "Initial server setup.."
 echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
 echo "[Task 1] - Logged in as Root with privatekey path"
 echo "ssh -i path/to/privatekey/ root@your_server_ip"
 echo ""
 echo "[Task 2] — Creating a New User"
 adduser sri --gecos "Sriharsha Vedurada,,," --disabled-password > /dev/null 2>&1
 echo ""
 echo "[Task 3] — Granting Administrative Privileges"
 usermod -aG sudo sri > /dev/null 2>&1
 echo ""
 echo "[Task 4] — Setting Up a Basic Firewall"
 ufw app list > /dev/null 2>&1
 echo "[Task 5] — Allow OpenSSH"
 ufw allow OpenSSH > /dev/null 2>&1
 echo "[Task 6] — Enable Firewall"
 ufw enable -y > /dev/null 2>&1
 echo "[Task 7] — Verifying Firewall is running"
 ufw status
 echo ""
 echo "[Task 6] — Enabling External Access for Your Regular User"
 rsync --archive --chown=sri:sri ~/.ssh /home/sri > /dev/null 2>&1
 echo "################# Completed #################"
 
 