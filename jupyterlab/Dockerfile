FROM python:3.9.10-slim-buster

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

RUN pip install --upgrade \
        pip \
        setuptools \
    && rm -rf ${HOME}/.pip/cache

RUN pip install \
        pandas \
        numpy \
        polars \
        scikit-learn \
        click \
        pendulum \
        plotly \
        tqdm \
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

# extensions
RUN pip install \
         jupyter_contrib_nbextensions \
         lckr-jupyterlab-variableinspector \
         jupyterlab_execute_time \
         jupyterlab-code-formatter black isort autopep8 \
         jupyterlab-nvdashboard \
         jupyterlab_tabnine \
         jupyterlab-git \
         stickyland \
         jupyterlab_autoscrollcelloutput \
    && rm -rf ${HOME}/.pip/cache

# plotly, widget, theme
# theme(https://pystyle.info/jupyterlab-list-of-themes/)
RUN jupyter labextension install \
         @jupyter-widgets/jupyterlab-manager \
         plotlywidget \
         jupyterlab-plotly \
         jupyterlab-tailwind-theme
