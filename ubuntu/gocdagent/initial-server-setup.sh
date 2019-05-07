 #!/bin/bash

 echo ""
 echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
 echo "Initial server setup.."
 echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
 echo "[Task 1] - Logged in as Root with privatekey path = ssh -i path/to/privatekey/ root@your_server_ip"
 echo -e "rootpwd\nrootpwd" | sudo passwd root > /dev/null 2>&1
 echo "[Task 2] — Creating a New User"
 adduser sri --gecos "Sriharsha Vedurada,,," --disabled-password > /dev/null 2>&1
 echo "[Task 3] — Granting Administrative Privileges"
 usermod -aG sudo sri > /dev/null 2>&1
 echo -e "sripwd\nsripwd" | sudo passwd sri > /dev/null 2>&1
 echo "[Task 4] — Setting Up a Basic Firewall"
 ufw app list > /dev/null 2>&1
 echo "[Task 5.1] — Disable complete SSH"
 ufw deny 22
 echo "[Task 5.2] — Allow SSH only from goserver"
 #ufw allow OpenSSH > /dev/null 2>&1
 ufw allow from 142.93.212.31 proto tcp to any port 22
 ufw allow from 10.139.40.18 proto tcp to any port 22
 echo "[Task 6] — Enable Firewall"
 ufw --force enable > /dev/null 2>&1
 echo "[Task 7] — Verifying Firewall is running"
 ufw status
 
 #echo "[Task 6] — Enabling External Access for Your Regular User"
 #rsync --archive --chown=sri:sri ~/.ssh /home/sri > /dev/null 2>&1
 echo "################# Completed #################"
 echo ""
 
 
