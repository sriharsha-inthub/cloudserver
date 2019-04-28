#!/bin/bash

 echo ""
 echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
 echo "Install GoServer"
 echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"

 echo "[Task 1]- Add gocd repository & key"
 echo "deb https://download.gocd.org /" | tee /etc/apt/sources.list.d/gocd.list > /dev/null 2>&1
 curl https://download.gocd.org/GOCD-GPG-KEY.asc | apt-key add -
 echo "[Task 2]- Update apt repository for latest packages"
 apt-get update > /dev/null 2>&1
 echo "[Task 3]- Install JDK - Prequisite"
 echo "To Install oracle jdk ->> Visit oracle website"
 echo "Installing open jdk"
 add-apt-repository -y ppa:openjdk-r/ppa > /dev/null 2>&1
 apt update > /dev/null 2>&1
 echo "        - Removing & purge existing open jdk"
 apt-get remove --auto-remove -y openjdk*
 apt-get purge --auto-remove -y openjdk*
 echo "        - Install openjdk-8-jdk"
 apt install -y openjdk-8-jdk
 echo "[Task 4]- Setting JAVA_HOME"
 echo JAVA_HOME="/usr/lib/jvm/java-8-oracle/jre/bin/java" | /etc/environment > /dev/null 2>&1
 cp environment /etc/environment
 source /etc/environment > /dev/null 2>&1
 echo $JAVA_HOME
 javac -version
 echo "[Task 5]- Install go server"
 apt install -y go-server > /dev/null 2>&1
 echo "/etc/init.d/go-server [start|stop|status|restart]"
 echo ""
 echo "################# Completed #################"
 echo "http://public_ip:8153/go || https://gocdserver:8154/go"
 
 echo "=============================================================="
 echo "######### Location of GoCD server files #########"
 echo ""
 echo "/var/lib/go-server       #contains the binaries and database"
 echo "/etc/go                  #contains the pipeline configuration files"
 echo "/var/log/go-server       #contains the server logs"
 echo "/usr/share/go-server     #contains the start script"
 echo "/etc/default/go-server   #contains all the environment variables with default values. These variable values can be changed as per requirement."
 echo ""
 echo "=============================================================="