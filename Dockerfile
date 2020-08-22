FROM openjdk:11-jdk-slim-buster

RUN apt update && \
    apt install -y unzip procps wget curl && \
	wget https://deac-ams.dl.sourceforge.net/project/pentaho/Pentaho%209.0/server/pentaho-server-ce-9.0.0.0-423.zip -O pentaho-server-ce-9.0.0.0-423.zip && \
    useradd -ms /bin/bash pentaho && \
    usermod -a -G pentaho pentaho && \
    unzip pentaho-server-ce-9.0.0.0-423.zip -d /home/pentaho && \
    chown -R pentaho:pentaho /home/pentaho && \
    rm -f pentaho-server-ce-9.0.0.0-423.zip

COPY start.sh /home/pentaho/start.sh

USER pentaho

WORKDIR /home/pentaho

CMD ["bash", "+x", "start.sh"]