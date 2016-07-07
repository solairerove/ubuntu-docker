#!/bin/bash

# install jdk-8u92

wget --no-check-certificate --no-cookies --header \
"Cookie: oraclelicense=accept-securebackup-cookie" \
http://download.oracle.com/otn-pub/java/jdk/8u92-b14/jdk-8u92-linux-x64.tar.gz

tar -xf jdk-8u92-linux-x64.tar.gz -C /usr/lib/jvm/
rm jdk-8u92-linux-x64.tar.gz

update-alternatives --remove-all javac
update-alternatives --remove-all java
update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.8.0_92/bin/javac 1
update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.8.0_92/bin/java 1
update-alternatives --config javac
update-alternatives --config java

# install maven 3.3.9

wget http://apache.osuosl.org/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz

tar -xf apache-maven-3.3.9-bin.tar.gz -C /opt/
rm apache-maven-3.3.9-bin.tar.gz

# install tomcat 8.0.36

wget --quiet --no-cookies \
http://www-us.apache.org/dist/tomcat/tomcat-8/v8.0.36/bin/apache-tomcat-8.0.36.tar.gz

tar -xf apache-tomcat-8.0.36.tar.gz -C /opt/
rm apache-tomcat-8.0.36.tar.gz
rm -rf /opt/apache-tomcat-8.0.36/webapps/examples
rm -rf /opt/apache-tomcat-8.0.36/webapps/docs

chown -R $(whoami) /opt/apache-tomcat-8.0.36/
chmod -R 777 /opt/apache-tomcat-8.0.36/

# install docker

apt-get install -y apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

rm -f /etc/apt/sources.list.d/docker.list
touch /etc/apt/sources.list.d/docker.list
echo deb https://apt.dockerproject.org/repo ubuntu-xenial main >> /etc/apt/sources.list.d/docker.list 
apt-get update
apt-get purge lxc-docker
apt-cache policy docker-engine
apt-get install -y docker-engine
service docker start

groupadd docker
usermod -aG docker $(whoami)

# install git

GIT_NAME="Nikita Krivitski"
GIT_EMAIL="hax2033@gmail.com"

apt-get install -y git

git config --global user.name "$GIT_NAME"
git config --global user.email $GIT_EMAIL

# install skype

apt-get install -y skype

# install chrome

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
apt-get -f install -y
rm -f google-chrome-stable_current_amd64.deb

# install virtual box

wget http://download.virtualbox.org/virtualbox/5.0.24/virtualbox-5.0_5.0.24-108355~Ubuntu~xenial_amd64.deb
dpkg -i virtualbox-5.0_5.0.24-108355~Ubuntu~xenial_amd64.deb
rm -f virtualbox-5.0_5.0.24-108355~Ubuntu~xenial_amd64.deb

# install node and npm

apt-get install -y build-essential libssl-dev
apt-get install -y nodejs
ln -s /usr/bin/nodejs /usr/bin/node
apt-get install -y npm

# install gulp

npm install -g gulp

# install typescript

npm install -g typescript

# install Intellij IDEA

wget https://download.jetbrains.com/idea/ideaIU-2016.1.3.tar.gz

mkdir ~/soft
tar -xf ideaIU-2016.1.3.tar.gz -C ~/soft/
rm ideaIU-2016.1.3.tar.gz

chmod +x ~/soft/idea-IU-145.1617.8/bin/idea.sh
sed -i '2s/.*/-Xmx2048m/' ~/soft/idea-IU-145.1617.8/bin/idea64.vmoptions

# install audacious

apt-get install -y audacious

# install gitkraken

wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
dpkg -i gitkraken-amd64.deb
rm -f gitkraken-amd64.deb

# install apache jmeter

wget http://ftp.byfly.by/pub/apache.org//jmeter/binaries/apache-jmeter-3.0.tgz
tar -xf apache-jmeter-3.0.tgz -C ~/soft/
rm apache-jmeter-3.0.tgz

chmod +x ~/soft/apache-jmeter-3.0/bin/jmeter.sh

# install apache directory studio

APACHE_STUDIO=ApacheDirectoryStudio-2.0.0.v20151221-M10-linux.gtk.x86_64.tar.gz

wget http://ftp.byfly.by/pub/apache.org/directory/studio/2.0.0.v20151221-M10/$APACHE_STUDIO
tar -xf $APACHE_STUDIO -C ~/soft/
rm $APACHE_STUDIO

# install mc

apt-get install -y mc

# install guake

apt-get install -y guake

# export variables

rm -f variables.sh
touch variables.sh

echo export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_92 >> variables.sh
echo export JMETER_HOME=~/soft/apache-jmeter-3.0 >> variables.sh

echo export PATH=/opt/apache-maven-3.3.9/bin:$PATH >> variables.sh
echo export PATH=~/soft/apache-jmeter-3.0/bin:$PATH >> variables.sh

rm -f /etc/profile.d/variables.sh
cp variables.sh /etc/profile.d/
rm -f variables.sh
