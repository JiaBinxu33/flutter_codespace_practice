# 使用一个包含常用开发工具的通用 Ubuntu 镜像作为基础
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# 设置 Flutter 的环境变量
ENV FLUTTER_HOME=/usr/local/flutter
ENV PATH=$FLUTTER_HOME/bin:$PATH

# 安装 Flutter 运行所需的依赖库
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends git curl unzip libglu1-mesa clang cmake ninja-build pkg-config

# 从 GitHub 克隆 Flutter SDK 的稳定版并安装
RUN git clone https://github.com/flutter/flutter.git $FLUTTER_HOME --depth 1 --branch stable

# 预先运行一次 flutter doctor，它会自动下载 Dart SDK 等核心依赖
RUN $FLUTTER_HOME/bin/flutter doctor

# 设置工作目录
WORKDIR /workspaces