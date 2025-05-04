ARG BASE_IMAGE
FROM ${BASE_IMAGE}

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
        opencv-python \
        Pillow \
    && rm -rf ${HOME}/.pip/cache
        # tensorflow-gpu \
