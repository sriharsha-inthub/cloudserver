 echo "Visit oracle to download linux version of package"
 echo "Agree to terms & conditions."
 echo "Down load to local m/c"
 echo "Move the downloaded package to to cloud server"
 
 echo "Remove Openjdk along with dependencies and it’s configuration "
 apt-get purge --auto-remove openjdk*
 mkdir /usr/java (on all machines)
 
 scp -i /home/sri/.ssh/do_id_rsa /mnt/c/Users/sriharsha/Downloads/jdk-8u211-linux-x64.tar.gz root@do-goserver:/usr/java/jdk-8u211-linux-x64.tar.gz
 scp -i /home/sri/.ssh/do_id_rsa /mnt/c/Users/sriharsha/Downloads/jdk-8u211-linux-x64.tar.gz root@do-goagent1:/usr/java/jdk-8u211-linux-x64.tar.gz
 scp -i /home/sri/.ssh/do_id_rsa /mnt/c/Users/sriharsha/Downloads/jdk-8u211-linux-x64.tar.gz root@do-goagent2:/usr/java/jdk-8u211-linux-x64.tar.gz
 
 echo "On each m/c"

 cd /usr/java/
 tar zxvf jdk-8u211-linux-x64.tar.gz
 rm jdk-8u211-linux-x64.tar.gz
 JAVA_HOME="/usr/java/jdk1.8.0_211/"
 JRE_HOME="/usr/java/jdk1.8.0_211/jre/"
 
 update-alternatives --install /usr/bin/java java ${JAVA_HOME%*/}/bin/java 20000
 update-alternatives --install /usr/bin/javac javac ${JAVA_HOME%*/}/bin/javac 20000
 update-alternatives --install /usr/bin/javaws javaws ${JAVA_HOME%*/}/bin/javaws 20000
 
 chmod a+x /usr/bin/java
 chmod a+x /usr/bin/javac
 chmod a+x /usr/bin/javaws
 
 echo "Reinstall maven"
 apt install -y maven
 
 echo "Reinstall goserver & go-agent"
 apt update
 apt install -y go-server
 apy install -y go-agent
