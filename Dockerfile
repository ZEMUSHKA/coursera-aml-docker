FROM ubuntu:16.04
LABEL maintainer="Zimovnov Andrey <zimovnov@gmail.com>"
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y -q python3-pip htop nano
RUN pip3 install -r requirements.txt
RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable codefolding/main

RUN useradd -m learner
USER learner
WORKDIR /home/learner
EXPOSE 8080
CMD ["jupyter", "notebook", "--no-browser", "--port", "8080", "--ip", "0.0.0.0"]