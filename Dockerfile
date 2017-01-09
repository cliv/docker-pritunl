FROM ubuntu:16.04
MAINTAINER include <cliv@ath0.net>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -yq && \
    apt-get install -yq software-properties-common python-software-properties apt-utils iptables && \
    echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list && \
    echo "deb http://repo.pritunl.com/stable/apt xenial main" > /etc/apt/sources.list.d/pritunl.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 42F3E95A2C4F08279C4960ADD68FA50FEA312927 && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A && \
    apt-get --assume-yes update && \
    apt-get --assume-yes upgrade && \
    apt-get --assume-yes install pritunl mongodb-org && \
    apt-get clean -y && \
    apt-get autoremove -y && \
    rm -rfv /tmp/* /var/lib/apt/lists/* /var/tmp/* && \
    mkdir /mongodb && \
    chown mongodb:mongodb /mongodb

ADD mongodb.conf /etc/mongodb.conf
ADD pritunl.conf /etc/pritunl.conf

ADD cmdline.sh /usr/local/bin/cmdline.sh

EXPOSE 1194
EXPOSE 443
EXPOSE 80

VOLUME ["/mongodb"]

ENTRYPOINT ["/usr/local/bin/cmdline.sh"]

CMD ["/usr/bin/tail", "-f", "/var/log/pritunl.log"]
