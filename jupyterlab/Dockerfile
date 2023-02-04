FROM python:3.11.1-slim-buster
#FROM python:3.9.13-slim-buster

RUN apt-get update && apt-get install -y --no-install-recommends \
        curl \
        jq \
        less \
        procps \
        locales \
        tree \
        vim \
        wget \
        unzip \
        zip \
        grep \
        git \
        libgomp1 \
        sudo \
    && localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade \
        pip \
        setuptools \
    && rm -rf ${HOME}/.pip/cache

RUN pip install \
        jupyterlab \
    && rm -rf ${HOME}/.pip/cache

RUN curl -sL https://deb.nodesource.com/setup_18.x |bash - \
    && apt-get install -y --no-install-recommends \
        nodejs \
        yarn

# fonts(RictyDiminished)
RUN apt-get update && apt-get install -y --no-install-recommends \
        fontconfig \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && cd /home \
    && wget https://github.com/mzyy94/RictyDiminished-for-Powerline/raw/master/RictyDiminished-Regular.ttf \
    && cp /home/RictyDiminished-Regular.ttf /usr/share/fonts/ \
    && rm -rf /home/**/.cache/matplotlib/fontlist-*

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
        pendulum \
        plotly \
        kaleido \
        tqdm \
    && rm -rf ${HOME}/.pip/cache

ENV PATH=${PATH}:/home/jupyter/.local/bin

RUN useradd --uid 1000 -G sudo,root jupyter \
    && echo "jupyter ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers.d/1000

RUN pip install ptpython
