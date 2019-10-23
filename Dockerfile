FROM ubuntu

RUN apt-get update 
RUN apt-get install -y android-tools-adb
RUN apt-get install -y wget
RUN apt-get install -y unzip
RUN apt-get install -y openjdk-8-jre

RUN wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
RUN unzip sdk-tools-linux-4333796.zip

RUN export PATH=/tools:$PATH
RUN export ANDROID_HOME=/tools

RUN apt-get install -y locales
RUN locale-gen en en_US en_US.UTF-8

RUN export LANG="en_US.UTF-8"
RUN export LC_ALL="en_US.UTF-8"

CMD /tools/bin/avdmanager create avd -n fred -f