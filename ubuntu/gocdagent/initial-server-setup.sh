 #!/bin/bash

 echo ""
 echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
 echo "Initial server setup.."
 echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
 echo "[Task 1] - Logged in as Root with privatekey path = ssh -i path/to/privatekey/ root@your_server_ip"
 echo -e "rootpwd\nrootpwd" | sudo passwd root > /dev/null 2>&1
 echo "[Task 2] — Creating a New User"
 adduser goadmin --gecos "goadmin,,," --disabled-password > /dev/null 2>&1
 echo "[Task 3] — Granting Administrative Privileges"
 usermod -aG sudo goadmin > /dev/null 2>&1
 echo -e "Goadmin@123\nGoadmin@123" | sudo passwd goadmin > /dev/null 2>&1
 echo "[Task 4] — Setting Up a Basic Firewall"
 ufw app list > /dev/null 2>&1
 echo "[Task 5] — Allow OpenSSH"
 ufw allow OpenSSH > /dev/null 2>&1
 echo "[Task 6] — Enable Firewall"
 ufw --force enable > /dev/null 2>&1
 echo "[Task 7] — Verifying Firewall is running"
 ufw status
 echo "[Task 6] — Enabling External Access for Your Regular User"
 rsync --archive --chown=Goadmin@123:Goadmin@123 ~/.ssh /home/sri > /dev/null 2>&1
 echo "################# Completed #################"
 echo ""
 
 
