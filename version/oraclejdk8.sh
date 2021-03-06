#!/bin/bash -e

echo "================ Installing oracle-java8-installer ================="
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections

add-apt-repository -y ppa:webupd8team/java
apt-get update
apt-get install -y oracle-java8-installer

update-alternatives --set java /usr/lib/jvm/java-8-oracle/jre/bin/java
update-alternatives --set javac /usr/lib/jvm/java-8-oracle/bin/javac

echo 'export JAVA_HOME=/usr/lib/jvm/java-8-oracle' >> /etc/drydock/.env
echo 'export PATH=$PATH:/usr/lib/jvm/java-8-oracle/bin' >> /etc/drydock/.env
