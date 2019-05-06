FROM ubuntu:artful

RUN apt-get update \
	&& apt-get install -y \
		wget \
		unzip \
		fontconfig \
		locales \
		gconf-service \
		libasound2 \
		libatk1.0-0 \
		libc6 \
		libcairo2 \
		libcups2 \
		libdbus-1-3 \
		libexpat1 \
		libfontconfig1 \
		libgcc1 \
		libgconf-2-4 \
		libgdk-pixbuf2.0-0 \
		libglib2.0-0 \
		libgtk-3-0 \
		libnspr4 \
		libpango-1.0-0 \
		libpangocairo-1.0-0 \
		libstdc++6 \
		libx11-6 \
		libx11-xcb1 \
		libxcb1 \
		libxcomposite1 \
		libxcursor1 \
		libxdamage1 \
		libxext6 \
		libxfixes3 \
		libxi6 \
		libxrandr2 \
		libxrender1 \
		libxss1 \
		libxtst6 \
		ca-certificates \
		fonts-liberation \
		libappindicator1 \
		libnss3 \
		lsb-release \
		xdg-utils \
		xvfb \
		libvips42 \
		awscli \
		curl \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
	&& apt-get update \
    && apt-get install -y nodejs \
		&& apt-get install -y git


RUN mkdir ~/.CocosCreator \
	&& mkdir ~/.CocosCreator/packages \
	&& cd ~/.CocosCreator/packages \
	&& git clone https://github.com/cocos-creator-packages/i18n \
	&& cd i18n \
	&& git checkout 0.0.2 \
	&& npm install tnpm -g --registry=http://registry.npm.alibaba-inc.com

ENV YARN_VERSION 1.3.2

RUN curl -fSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" \
  	&& mkdir -p /opt/yarn \
  	&& tar -xzf yarn-v$YARN_VERSION.tar.gz -C /opt/yarn --strip-components=1 \
  	&& ln -s /opt/yarn/bin/yarn /usr/local/bin/yarn \
  	&& ln -s /opt/yarn/bin/yarn /usr/local/bin/yarnpkg \
  	&& rm yarn-v$YARN_VERSION.tar.gz \
  	&& apt-get clean

WORKDIR /opt

COPY cocos-build.sh /opt/cocos-build.sh
COPY cocos-creator  /opt/cocos-creator
COPY build.sh       /opt/build.sh
COPY start.sh       /opt/start.sh

RUN tnpm install
RUN chmod +x start.sh
RUN chmod +x build.sh
CMD ["/bin/bash","start.sh"]
