FROM hseeberger/scala-sbt

RUN git clone https://github.com/killrweather/killrweather.git

WORKDIR killrweather

RUN sbt compile

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF

RUN echo "deb http://repos.mesosphere.com/debian jessie main" | tee /etc/apt/sources.list.d/mesosphere.list

RUN apt-get -y update

RUN apt-get -y install mesos