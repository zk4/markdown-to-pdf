FROM ubuntu:22.04

RUN apt-get update \
  && apt-get -y install \
    libcairo2 \
    libffi-dev \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    python3-pip \
    wget \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/*

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install ./google-chrome-stable_current_amd64.deb

RUN pip3 install --no-cache \
    Pillow \
    click \
    markdown \
    markdown-include \
    weasyprint \
    watchdog \
    beautifulsoup4=="4.9.3" \
    mkdocs-with-pdf \
    pymdown-extensions \
    mkdocs-extra-sass-plugin \
    mkdocs-material \
    mkdocs-material-extensions \
    mdx-gh-links \
    mkdocs-redirects \
    mkdocs-minify-plugin \
    python-barcode \
    livereload \
    qrcode \
    mkdocs \
    -i https://pypi.tuna.tsinghua.edu.cn/simple

RUN mkdir /app

COPY md2pdf.py /app

WORKDIR /app
