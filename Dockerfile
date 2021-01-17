FROM ubuntu:16.04
USER root

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y curl htop git zip nano ncdu build-essential chrpath libssl-dev libxft-dev pkg-config glib2.0-dev libexpat1-dev gobject-introspection python-gi-dev apt-transport-https libgirepository1.0-dev libtiff5-dev libjpeg-turbo8-dev libgsf-1-dev fail2ban nginx -y
RUN apt-get -y install libssl1.0.0 libssl-dev

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN apt-get install --yes nodejs
RUN node -v
RUN npm -v
RUN npm i -g nodemon
RUN nodemon -v


# Install wget
RUN apt-get -y install wget

# Install http-server
RUN npm install --global http-server

# Install utorrent-server
RUN wget http://download-new.utorrent.com/endpoint/utserver/os/linux-x64-ubuntu-13-04/track/beta/ -O utorrent.tar.gz
RUN tar -zxvf utorrent.tar.gz -C /opt/
RUN chmod 777 /opt/utorrent-server-alpha-v3_3/
RUN ln -s /opt/utorrent-server-alpha-v3_3/utserver /usr/bin/utserver
COPY / /opt/utorrent-server-alpha-v3_3/

EXPOSE 8080

CMD /usr/bin/utserver -settingspath /opt/utorrent-server-alpha-v3_3/ -configfile /opt/utorrent-server-alpha-v3_3/utserver.conf -logfile /opt/utorrent-server-alpha-v3_3/utserver.log



