From ai02:5000/tensorflow:1.0.0-gpu-py3

COPY gpu-memory.patch /tmp

RUN patch -b /usr/local/lib/python3.4/dist-packages/tensorflow/python/client/session.py /tmp/gpu-memory.patch
RUN rm /tmp/gpu-memory.patch

RUN mv /notebooks /notebooks.orig
COPY ./notebooks /notebooks
