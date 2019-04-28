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
 echo "[Task 6] — Setting Up Server Blocks (Recommended)"
 echo "         - Domain name inthub.dev | www.inthub.dev"
 mkdir -p /var/www/inthub.dev/html > /dev/null 2>&1
 chown -R sri:sri /var/www/inthub.dev/html
 chmod -R 755 /var/www/inthub.dev
 
 mkdir /var/www/inthub.dev/html
 cp inthub.dev.index.html /var/www/inthub.dev/html/
 
 mkdir /etc/nginx/sites-available/inthub.dev
 cp inthub.dev /etc/nginx/sites-available/inthub.dev
  
 ln -s /etc/nginx/sites-available/inthub.dev /etc/nginx/sites-enabled/
 
 echo "Update file [/etc/nginx/nginx.conf] - uncomment server_names_hash_bucket_size ***"
 nginx -t
 systemctl restart nginx
 echo "################# Completed #################"
 echo ""
 