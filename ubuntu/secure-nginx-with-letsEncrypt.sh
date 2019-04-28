  #!/bin/bash

 echo ""
 echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
 echo "Secure Nginx with Let's Encrypt"
 echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
 echo "[Task 1]– Add offical Certbot repositiry for latest versions"
 add-apt-repository -y ppa:certbot/certbot > /dev/null 2>&1
 echo "[Task 2]– Installing Certbot's Nginx package"
 apt install -y python-certbot-nginx > /dev/null 2>&1
 echo "[Task 3]- Confirming Nginx's Configuration"
 cat /etc/nginx/sites-available/inthub.dev | grep server_name
 echo "[Task 4]- Checking nginx configuration .."
 nginx -t 
 echo "[Task 5]- Reloading Nginx for changes to take effect"
 systemctl reload nginx
 
 echo "[Task 6]-  Obtaining an SSL Certificate"
 certbot --nginx -d inthub.dev -d gateway.inthub.dev -d www.inthub.dev --non-interactive --agree-tos -m $1
 
 echo "[Task 7]- Verifying Certbot Auto-Renewal"
 certbot renew --dry-run
 
 curl --max-time 5 https://inthub.dev | grep "inthub.dev - a dev project(s) domain"
 
 echo ""
 echo "################# Completed #################"
 echo ""