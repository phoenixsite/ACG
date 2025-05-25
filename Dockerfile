FROM nvcr.io/nvidia/pytorch:25.04-py3

USER crc00098
WORKDIR /workspace/ACG
#COPY . .

ENV CUBLAS_WORKSPACE_CONFIG=:4096:8 
ENV PYTHONHASHSEED=0

RUN pip install --upgrade pip
RUN apt update

RUN pip install -r requirements.txt
#RUN pip install git+https://github.com/fra31/auto-attack

RUN cd src/utils/cluster_coef_c \
    && python3 setup.py build_ext -i

RUN echo "alias python='python3'" >> ~/.bashrc

CMD ["/bin/bash"]
