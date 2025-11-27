FROM ubuntu:24.04

# 安装 Python3 及相关依赖
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        python3 \
        python3-uvloop \
        python3-cryptography \
        python3-socks \
        libcap2-bin \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# 允许 Python3 绑定低端口（<1024）
RUN setcap cap_net_bind_service=+ep /usr/bin/python3.12

CMD ["python3"]
