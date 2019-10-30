FROM ubuntu

 RUN apt-get -qqy update 
 RUN apt-get -qqy install android-tools-adb
 RUN apt-get -qqy install wget
 RUN apt-get -qqy install unzip
 RUN apt-get -qqy install ca-certificates
 RUN apt-get -qqy install ca-certificates-java
 RUN apt-get -qqy install lib32ncurses5 lib32stdc++6
 
 ENV ANDROID_HOME=/tools
 ENV PATH=$PATH:$ANDROID_HOME:$ANDROID_HOME/bin
 
 RUN wget https://download.java.net/openjdk/jdk10/ri/jdk-10_linux-x64_bin_ri.tar.gz
 RUN tar -xzvf jdk-10_linux-x64_bin_ri.tar.gz
 ENV PATH=/jdk-10/bin:$PATH
 
 RUN wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
 RUN unzip sdk-tools-linux-4333796.zip && rm sdk-tools-linux-4333796.zip
 
 RUN apt-get install -y locales
 RUN locale-gen en en_US en_US.UTF-8
 
 ENV TZ="US/Pacific"
 RUN echo "${TZ}" > /etc/timezone
 ENV LANG="en_US.UTF-8"
 ENV LC_ALL="en_US.UTF-8"
 ENV LANGUAGE="en_US.UTF-8"
 ENV JAVA_OPTS='-XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee'
 
 CMD /tools/bin/avdmanager create avd -n fred -f