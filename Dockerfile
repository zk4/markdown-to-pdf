FROM ubuntu:22.04

RUN apt-get update \
  && apt-get -y install \
    libcairo2 \
    libffi-dev \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    python3-pip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/*

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

RUN pip3 install --no-cache \
    Pillow \
    click \
    markdown \
    markdown-include \
    weasyprint \
    watchdog \
    -i https://pypi.tuna.tsinghua.edu.cn/simple

RUN mkdir /app

COPY md2pdf.py /app

WORKDIR /app
