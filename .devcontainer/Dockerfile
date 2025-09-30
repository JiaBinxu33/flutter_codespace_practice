# 使用一个包含基础开发工具的官方 Ubuntu 镜像
FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu-22.04

# 定义 Flutter 版本
ARG FLUTTER_VERSION=3.24.0

# 更新系统并安装 Flutter 和 Chrome 所需的依赖
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends git curl unzip wget libgconf-2-4 libglu1-mesa libxi6 libxcursor1 libxinerama1 libxrandr2 libxtst6 libnss3 libatk-bridge2.0-0 libgtk-3-0

# --- 新增部分：安装 Google Chrome ---
RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && apt-get install -y ./google-chrome-stable_current_amd64.deb \
    && rm google-chrome-stable_current_amd64.deb
# --- 新增部分结束 ---

# 下载、解压并设置 Flutter SDK
RUN cd /usr/local \
    && curl -o flutter.tar.xz "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz" \
    && tar xf flutter.tar.xz \
    && rm flutter.tar.xz

# 将 Flutter 添加到系统路径中
ENV PATH="/usr/local/flutter/bin:${PATH}"

# 切换到 Codespaces 默认的 vscode 用户，并预热 Flutter
USER vscode
RUN flutter precache --no-ios --no-android && \
    flutter doctor