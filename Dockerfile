# Dockerfile used to build Docker images based on Ubuntu 16.04 for Zanata/SMI Translate development
FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

# Info
LABEL dockerfile.version="2.0.0"
LABEL dockerfile.release-date="2017-09-01"
LABEL zanata.version="4.2.4"

# install required packages
# NOTE: KEEP ALPHANUMERICALLY SORTED
RUN apt-get update && apt-get install -y --no-install-recommends \ 
	apt-transport-https \
	build-essential \
	curl \
	dos2unix \
	git \
	locales \
	maven \
	nano \
	openjdk-8-jdk \
	python \
	ruby \
	ruby-dev \
	wget \
	zsh \
	&& rm -rf /var/lib/apt/lists/*

# config locale
RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

SHELL ["/bin/bash", "-c"]

RUN gem update --system
RUN gem install compass compass-rgbapng sass breakpoint jekyll

# workaround https://github.com/chapmanb/bcbio-nextgen/issues/670
RUN git config --global url."https://".insteadOf git://

# entrypoint
CMD ["bash"]
