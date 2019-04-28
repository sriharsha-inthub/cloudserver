#!/bin/bash

 echo ""
 echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
 echo "Install GoAgent"
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
 echo "[Task 5]- Install go agent"
 apt install -y go-agent > /dev/null 2>&1
 echo "/etc/init.d/go-agent [start|stop|status|restart]"
 
 echo "=============================================================="
 
 echo "######### Configuring the go-agent #########"
 echo ""
 echo "Open /etc/default/go-agent       		#Change GO_SERVER url to correect IP"
 echo "GO_SERVER_URL=https://127.0.0.1:8154/go  #127.0.0.1 to Actual IP"
 echo "Run /etc/init.d/go-agent [start|restart] to (re)start the agent."
 echo ""
 echo "######### Location of GoCD agent files #########"
 echo ""
 echo "/var/lib/go-agent      #contains the binaries"
 echo "/usr/share/go-agent    #contains the start script"
 echo "/var/log/go-agent      #contains the agent logs"
 echo "/etc/default/go-agent  #contains all the environment variables with default values. These variable values can be changed as per requirement"
 echo "=============================================================="
 
 echo "Open GO_SERVER dashboard @https://docs.gocd.org/current/configuration/managing_a_build_cloud.html"
 