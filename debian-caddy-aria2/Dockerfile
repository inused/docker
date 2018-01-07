# version: 1
FROM debian:jessie
MAINTAINER laoimam "dockerhub@temp.tk"
RUN adp-get update && \
		apt-get install -y openssh-server zip unzip screen php7.0 php7.0-fpm curl wget php7.0-cgi php7.0-curl php7.0-gd cron ffmpeg curl locales iptables && \
		mkdir -p /home/tmp && \
		cd /home/tmp && \
		wget -N --no-check-certificate "https://raw.githubusercontent.com/zhzjwd/docker/master/debian-caddy-aria2/sh/caddy_install.sh" && \
		chmod +x caddy_install.sh && \
		bash caddy_install.sh install http.filemanager,http.git && \
		cd /home/tmp && \
		wget -N --no-check-certificate "https://raw.githubusercontent.com/zhzjwd/docker/master/debian-caddy-aria2/sh/aria2.sh" && \
		chmod +x aria2.sh && \
		bash aria2.sh install && \
		cd /home/tmp && \
		wget -N --no-check-certificate "https://raw.githubusercontent.com/zhzjwd/docker/master/debian-caddy-aria2/sh/rclone.sh" && \
		chmod +x rclone.sh && \
		bash rclone.sh && \
		rm -rf /var/lib/apt/lists/* && \
		rm -rf /home/tmp && \
		apt-get clean

RUN echo 'root:root' | chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
	sed -ri 's/^#PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
	sed -ri '/^PermitRootLogin/a\#PermitRootLogin prohibit-password' /etc/ssh/sshd_config && \
	sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir -p /var/run/sshd && \
	mkdir -p /var/run/php && \
	mkdir -p /home/down && \
	mkdir -p /home/ariang && \
	mkdir -p /root/.config/rclone

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]
CMD    ["/usr/sbin/cron", "-D"]
CMD    ["/usr/sbin/php-fpm7.0", "-D"]