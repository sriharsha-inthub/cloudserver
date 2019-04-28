 #!/bin/bash

 echo ""
 echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
 echo "Initial & configure Nginx "
 echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
 echo "[Task 1]– Installing Nginx"
 apt update && apt install -y nginx
 echo "[Task 2] — Adjusting the Firewall"
 ufw app list > /dev/null 2>&1
 echo "[Task 3] — Allow Nginx HTTP & HTTPS"
 ufw allow "Nginx Full" > /dev/null 2>&1
 echo "[Task 4] — Verify the change"
 ufw status
 echo "[Task 5] — Checking your nginx web Server"
 systemctl status nginx | Active:
 echo "[Task 6] — Testing webpage"
 curl http://localhost
 echo "[Task 7] — Setting Up Server Blocks (Recommended)"
 echo "         - Domain name inthub.dev | www.inthub.dev"
 echo "[Task 7] — Creating a dir for domain inthub.dev - /var/www/inthub.dev/html"
 mkdir -p /var/www/inthub.dev/html > /dev/null 2>&1
 echo "[Task 8] — Setting user permissions for dir inthub.dev/html"
 chown -R sri:sri /var/www/inthub.dev/html
 echo "[Task 9] — Making sure files have correct permission  /var/www/inthub.dev/* "
 chmod -R 755 /var/www/inthub.dev
 echo "[Task 10] — Setting up index page for inthub.dev"
 mkdir /var/www/inthub.dev/html
 cp inthub.dev.index.html /var/www/inthub.dev/html/
 
 echo "[Task 11] — Setting up nginx server block for inthub.dev"
 cp inthub.dev /etc/nginx/sites-available/inthub.dev
 
 echo "[Task 12] - Enabling the inthub.dev for Nginx" 
 ln -s /etc/nginx/sites-available/inthub.dev /etc/nginx/sites-enabled/
 
 echo "[Task 13] - To avoid a possible hash bucket memory problem" 
 echo "Update file [/etc/nginx/nginx.conf] - uncomment server_names_hash_bucket_size ***"
 nginx -t
 systemctl restart nginx
 echo ""
 curl http://inthub.dev
 echo ""
 echo "################# Completed #################"
 echo ""
 
 