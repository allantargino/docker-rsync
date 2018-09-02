FROM debian:jessie

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends rsync && \
  apt-get clean autoclean && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt/lists/*
	
ADD ./start /usr/local/bin/start
ADD rsyncd.conf /etc/rsyncd.conf
	
ENV SOURCE=
ENV TARGET=
ENV SYNC_TIME=0
ENV EXIT_AFTER_COPY=false

ENTRYPOINT ["/usr/local/bin/start"]