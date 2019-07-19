FROM debian:latest

WORKDIR /srv/apu-server
COPY . .

RUN apt-get update -q && apt-get install -qy \
    curl \
    ca-certificates \
    gnupg2 \
    build-essential \
    git \
    procps \
	&& apt-get clean

RUN curl -sSL https://get.rvm.io | bash -s
RUN /bin/bash -l -c ". /etc/profile.d/rvm.sh && rvm install 2.6"
RUN /bin/bash -l -c ". /etc/profile.d/rvm.sh && cd /srv/apu-server && bundle install"

ENTRYPOINT /bin/bash -l -c ". /etc/profile.d/rvm.sh && cd /srv/apu-server && ./server.sh"