FROM cn47/jupyterlab-gpu:3.10.9

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

RUN pip install \
        torch \
        torchvision \
        torchaudio \
        albumentations \
        tensorflow-gpu \
        opencv-python \
        Pillow \
    && rm -rf ${HOME}/.pip/cache
