FROM python:3.11.1-slim-buster
#FROM python:3.9.13-slim-buster

RUN apt-get update && apt-get install -y --no-install-recommends \
        curl \
        locales \
        less \
        wget \
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

ARG _HOME
RUN mkdir -p ${_HOME}/.local/share/ptpython
COPY ptpython_config.py ${_HOME}/.config/ptpython/config.py
RUN chmod -R 777 ${_HOME}
