FROM gitpod/openvscode-server:latest
USER root
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y sudo && apt-get install -y python3-pip && pip3 install --upgrade pip
RUN apt-get install -y curl gnupg wget htop sudo git git-lfs software-properties-common build-essential libgl1 zip unzip
RUN add-apt-repository ppa:flexiondotorg/nvtop
RUN apt-get upgrade -y
RUN apt-get install -y nvtop
RUN update;apt -y install curl unzip autoconf git cmake binutils build-essential net-tools screen golang
RUN apt-get install screen -y
RUN apt install build-essential -y
RUN apt-get install -y ca-certificates wget libcurl4 libjansson4 libgomp1
RUN pip3 install pandas scipy matplotlib && \
    pip3 install ipywidgets && \
    pip3 install torch torchvision torchaudio
 
USER root

EXPOSE 8888

ENTRYPOINT [ "/bin/sh", "-c", "exec ${OPENVSCODE_SERVER_ROOT}/bin/openvscode-server --host 0.0.0.0 --port 8888 --without-connection-token \"${@}\"", "--" ]
