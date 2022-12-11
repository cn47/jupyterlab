FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04

ARG _PYTHON_VER=3.9
ARG  PYTHON_VER=3.9.10


RUN apt-get update && apt-get install -y --no-install-recommends \
        curl \
        jq \
        less \
        locales \
        tree \
        vim \
        wget \
        unzip \
        git \
    && localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# install python
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        zlib1g-dev \
        libncurses5-dev \
        libgdbm-dev \
        libnss3-dev \
        libssl-dev \
        libreadline-dev \
        libffi-dev \
        libsqlite3-dev \
        libbz2-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://www.python.org/ftp/python/${PYTHON_VER}/Python-${PYTHON_VER}.tgz \
    && tar -xf Python-${PYTHON_VER}.tgz \
    && cd Python-${PYTHON_VER} \
    && ./configure --enable-optimizations \
    && make -j 12 \
    && make altinstall \
    && cd ..  && rm -rf Python-${PYTHON_VER}* \
    && ln -sfn /usr/local/bin/python${_PYTHON_VER} /bin/python \
    && ln -sfn /usr/local/bin/python${_PYTHON_VER} /bin/python3

RUN apt-get update && apt-get install -y --no-install-recommends \
        python3-distutils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py


# install jupyter
RUN pip install \
        jupyterlab \
    && rm -rf ${HOME}/.pip/cache

RUN curl -sL https://deb.nodesource.com/setup_18.x |bash - \
    && apt-get install -y --no-install-recommends \
        nodejs \
        yarn

# fonts(RictyDiminished)
RUN cd ${HOME} \
    wget https://github.com/mzyy94/RictyDiminished-for-Powerline/raw/master/RictyDiminished-Regular.ttf \
    mkdir -p ${HOME}/.jupyter/custom/fonts \
    cp ${HOME}/RictyDiminished-Regular.ttf ${HOME}/.jupyter/custom/fonts

# reinstall pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py
RUN pip install --upgrade \
        pip \
        setuptools \
    && rm -rf ${HOME}/.pip/cache

# extensions
RUN pip install \
         jupyter_contrib_nbextensions \
         lckr-jupyterlab-variableinspector \
         jupyterlab_execute_time \
         jupyterlab-code-formatter black isort autopep8 \
         jupyterlab-nvdashboard \
         jupyterlab-git \
         stickyland \
         jupyterlab_autoscrollcelloutput \
    && rm -rf ${HOME}/.pip/cache
         # jupyterlab_tabnine \ # disable temporarily

# plotly, widget, theme
# theme(https://pystyle.info/jupyterlab-list-of-themes/)
RUN jupyter labextension install \
         @jupyter-widgets/jupyterlab-manager \
         plotlywidget \
         jupyterlab-plotly \
         jupyterlab-tailwind-theme


RUN pip install \
        pandas \
        numpy \
        polars \
        scikit-learn \
        click \
        pendulum \
        plotly \
        kaleido \
        tqdm \
    && rm -rf ${HOME}/.pip/cache

RUN pip install \
        torch \
        torchvision \
        torchaudio \
        albumentations \
        tensorflow-gpu \
        opencv-python \
        Pillow \
    && rm -rf ${HOME}/.pip/cache
