FROM python:3.10.1-slim-buster

ENV LANG=ja_JP.UTF-8 \
    LANGUAGE=ja_JP:ja \
    LC_ALL=ja_JP.UTF-8 \
    TZ=JST-9 \
    TERM=xterm-256color \
    PYTHONUTF8=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_NO_CACHE_DIR=off

RUN apt-get update && apt-get install -y --no-install-recommends \
        less \
        locales \
        vim \
    && localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /tmp
COPY requirements.txt /tmp

RUN pip install --upgrade \
        pip \
        setuptools \
    && pip install -r requirements.txt \
    && rm -rf ~/.pip/cache

CMD bash
