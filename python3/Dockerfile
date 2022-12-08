FROM python:3.9.10-slim-buster

RUN apt-get update && apt-get install -y --no-install-recommends \
        curl \
        git \
        locales \
        less \
        tree \
        unzip \
        vim \
        wget \
        zsh \
    && localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
COPY requirements.txt /tmp

RUN pip install --upgrade \
        pip \
        setuptools \
    && pip install -r requirements.txt \
    && rm -rf ${HOME}/.pip/cache

ARG HOME_DIR=/home/cn47
RUN mkdir -p ${HOME_DIR}/.local/share/ptpython
COPY ptpython_config.py ${HOME_DIR}/.config/ptpython/config.py
RUN chmod -R 777 ${HOME_DIR}
