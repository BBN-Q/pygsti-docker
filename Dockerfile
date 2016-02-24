FROM jupyter/scipy-notebook
MAINTAINER Marcus Silva "msilva@bbn.com"

USER jovyan

RUN /bin/bash -c "source activate python2; conda install lxml cvxopt; pip install python-pptx; pip install cvxpy;"

RUN git clone https://github.com/pyGSTio/pyGSTi.git
RUN cd pyGSTi; python2.7 install_locally.py
