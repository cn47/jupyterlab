FROM cn47/jupyterlab:3.11.1

RUN pip install \
        pandas \
        numpy \
        polars \
        scikit-learn \
        pendulum \
        plotly \
        ptpython \
        kaleido \
        tqdm \
        PyYAML \
    && rm -rf ${HOME}/.pip/cache
