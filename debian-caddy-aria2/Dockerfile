# version: 1
FROM debian:jessie
MAINTAINER laoimam "dockerhub@temp.tk"
ENV BUILD_PATH /tmp
RUN mkdir -p $BUILD_PATH
WORKDIR $BUILD_PATH
ADD https://raw.githubusercontent.com/zhzjwd/docker/master/debian-caddy-aria2/sh/caddy_install.sh $BUILD_PATH/caddy_install.sh
ADD https://raw.githubusercontent.com/zhzjwd/docker/master/debian-caddy-aria2/sh/aria2.sh $BUILD_PATH/aria2.sh
ADD https://raw.githubusercontent.com/zhzjwd/docker/master/debian-caddy-aria2/sh/rclone.sh $BUILD_PATH/rclone.sh
RUN apt-get update && \
	apt-get install -y openssh-server zip unzip screen curl wget cron locales locales-all iptables nano p7zip p7zip-full make fuse gcc g++  && \
	echo "deb http://packages.dotdeb.org jessie all\ndeb-src http://packages.dotdeb.org jessie all" > /etc/apt/sources.list.d/dotdeb.list && \
	wget http://www.dotdeb.org/dotdeb.gpg -O /tmp/dotdeb.gpg && apt-key add /tmp/dotdeb.gpg && rm /tmp/dotdeb.gpg && \
	apt-get update && \
	apt-get install -y php7.0 php7.0-fpm php7.0-cgi php7.0-curl php7.0-gd php7.0-zip && \
	mkdir -p /var/run/sshd && \
	mkdir -p /var/run/php && \
	mkdir -p /home/down && \
	mkdir -p /home/ariang && \
	mkdir -p /root/.config/rclone && \
	bash caddy_install.sh install http.filemanager,http.git && \
	bash aria2.sh install && \
	bash rclone.sh && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf $BUILD_PATH/* && \
	apt-get clean && \
	sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
	sed -ri 's/^#PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
	sed -ri '/^PermitRootLogin/a\#PermitRootLogin prohibit-password' /etc/ssh/sshd_config && \
	sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
	echo 'root:root' | chpasswd

ENV LC_ALL zh_CN.UTF-8
ENV LANG zh_CN.UTF-8

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]