# Dockerfile used to build Docker images based on Ubuntu 16.04 for Zanata/SMI Translate development

FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive


# Info
LABEL dockerfile.version="1.0.0"
LABEL dockerfile.release-date="2016-11-11"
LABEL dockerfile.author="nicdalm"
LABEL zanata.version="4.2.0"

# replace default sh shell with bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

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
	&& rm -rf /var/lib/apt/lists/*

# config locale
RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

SHELL ["/bin/bash", "-c"]

# add node through nvm and configure it
# RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash && \
# 	export NVM_DIR="$HOME/.nvm" && \
# 	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" && \
# 	nvm install --lts && \
# 	mkdir "$HOME"/.npm-global && \
# 	npm config set prefix "~/.npm-global" && \
# 	echo "export PATH=\"\$PATH:\$HOME/.npm-global/bin\"" >> $HOME/.bashrc

# install npm deps
# RUN npm install -g npm yarn grunt@0.4.1 grunt-cli

# install ruby deps
# workaround https://github.com/rubygems/rubygems/issues/1736
RUN update-ca-certificates
COPY .gemrc.txt /root/.gemrc
RUN cat /root/.gemrc
RUN gem update --system
RUN gem install compass compass-rgbapng sass breakpoint jekyll

# entrypoint
CMD ["bash"]
