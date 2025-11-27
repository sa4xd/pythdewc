FROM ubuntu:24.04

# 安装 Python3 及相关依赖
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        python3 \
        python3-pip \
        python3-uvloop \
        python3-cryptography \
        python3-socks \
        libcap2-bin \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# 安装 Flask（轻量 Web 框架）
RUN pip3 install flask

# 允许 Python3 绑定低端口（<1024）
RUN setcap cap_net_bind_service=+ep /usr/bin/python3.12

# 添加一个简单 Web 应用
WORKDIR /app
COPY app.py /app/app.py

EXPOSE 8080
CMD ["python3", "app.py"]
