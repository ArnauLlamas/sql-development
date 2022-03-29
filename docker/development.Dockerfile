FROM ubuntu:20.04

WORKDIR /code

# Install basic packages
ARG PACKAGES="\
  make \
  mysql-client \
  curl \
  wget \
  lsb-release"

RUN apt-get update \
    && apt-get install -y ${PACKAGES}

# Install Docker and Docker Compose
RUN apt install docker.io -y \
    && curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

# Install Postgres 14 client
RUN wget -qO /etc/apt/trusted.gpg.d/pgdg.asc https://www.postgresql.org/media/keys/ACCC4CF8.asc \
    && echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -sc)-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list \
    && apt-get update \
    && apt-get install -y postgresql-client-14

# Fix perl issue
ENV LC_ALL=C

ENTRYPOINT ["tail", "-f", "/dev/null"]
