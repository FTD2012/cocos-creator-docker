 
# Linux版本的CocosCreator
- 为什么会有这个项目？  
为了能在Docker下进行前端的持续集成，于是构建了基于Linux环境下可运行的Cocos Creator的若干版本。

❗目前只在Ubuntu18.04下测试过  
❗部分版本Cocos Creator没有cocos2d-x游戏引擎，可能需要自己添加

---

## Getting Started


### 1. 下载项目到系统中
```
$ git clone https://github.com/FTD2012/cocos-creator-docker.git
```
### 2. 在Ubuntu中执行如下命令安装必要的环境
```
$ apt-get update \
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
    && apt-get install -y nodejs
```
### 3. 使用命令打开工程或者构建工程
打开工程
```
$ cd /path/to/cocos-creator-docker  
$ ./cocos-creator-x.x.x/cocos-creator --path './CocosTemplateProject/'
```
构建工程
```
$ cd /path/to/cocos-creator-docker
$ ./cocos-creator-x.x.x/cocos-creator --path './CocosTemplateProject/' --build 'platform=web-mobile;debug=true'
```

---

## 各个版本应用情况
> development: 可以在Linux下进行**开发**，需要GUI环境  
> build：可以在Linux下进行**构建**，不需要GUI环境

| cocos creator version | development | build |
| ------ | ------ | ------ |
| 2.0.9 | ✅ | ✅ |
| 2.0.5 | ✅ | ✅ |
| 1.9.3 | ✅ | ✅ |
| 1.9.0 | ✅ | ✅ |
| 1.6.1 | ❌ | ✅ |

---

## **Q&A**
### 1. 我需要的x.x.x版本在上述列表中没有怎么办？  
> - 在cocos-creator-docker下复制cocos-creator-2.0.5，并命名为cocos-creator-x.x.x  
> - 下载相应版本的Cocos Creator x.x.x（Mac或者Windows）  
> - 使用 <u>Cocos Creator/Resources/</u> 覆盖 <u>cocos-creator-docker/cocos-creator-x.x.x/resouces</u> 除了 <u>utils/</u> 的其他内容  

### 2. 没有GUI环境的插件怎么安装？
> 复制 <u>~/.CocosCreator/packages(Mac)</u> 下的内容至<u>~/.CocosCreator/packages(Linux)</u>