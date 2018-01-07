# version: 1
FROM debian:jessie
MAINTAINER laoimam "dockerhub@temp.tk"
ENV BUILD_PATH /home/tmp
RUN mkdir -p $BUILD_PATH
WORKDIR $BUILD_PATH
ADD https://raw.githubusercontent.com/zhzjwd/docker/master/debian-caddy-aria2/sh/caddy_install.sh $BUILD_PATH/caddy_install.sh
ADD https://raw.githubusercontent.com/zhzjwd/docker/master/debian-caddy-aria2/sh/aria2.sh $BUILD_PATH/aria2.sh
ADD https://raw.githubusercontent.com/zhzjwd/docker/master/debian-caddy-aria2/sh/rclone.sh $BUILD_PATH/rclone.sh
RUN adp-get update && \
	apt-get install -y openssh-server zip unzip screen php7.0 php7.0-fpm curl wget php7.0-cgi php7.0-curl php7.0-gd cron ffmpeg curl locales iptables && \
	bash $BUILD_PATH/caddy_install.sh install http.filemanager,http.git && \
	bash $BUILD_PATH/aria2.sh install && \
	bash $BUILD_PATH/rclone.sh && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /home/tmp && \
	apt-get clean && \
	mkdir -p /var/run/sshd && \
	mkdir -p /var/run/php && \
	mkdir -p /home/down && \
	mkdir -p /home/ariang && \
	mkdir -p /root/.config/rclone
	
RUN echo 'root:root' | chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
	sed -ri 's/^#PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
	sed -ri '/^PermitRootLogin/a\#PermitRootLogin prohibit-password' /etc/ssh/sshd_config && \
	sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]