FROM ubuntu:focal

# Create app directory
WORKDIR /usr/src/app

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install openssl libssl-dev pkg-config build-essential curl nano git less dirmngr gpg gawk -y

# Install asdf
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1
RUN echo '. ~/.asdf/asdf.sh\n' >> ~/.bashrc &&\
    echo '. ~/.asdf/completions/asdf.bash\n' >> ~/.bashrc

COPY asdf-install-plugins /
COPY asdf-install-versions /

# This is required to source bashrc correctly
SHELL ["/bin/bash", "-i", "-c"]
