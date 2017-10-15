FROM ubuntu:16.04
LABEL maintainer="Zimovnov Andrey <zimovnov@gmail.com>"
ARG DEBIAN_FRONTEND=noninteractive

ADD requirements.txt /
RUN apt-get update
RUN apt-get install -y -q python3-pip htop nano

RUN pip3 install -r requirements.txt

RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable codefolding/main
RUN echo "c.NotebookApp.ip = '*'" >> /root/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.port = '8080'" >> /root/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.token = ''" >> /root/.jupyter/jupyter_notebook_config.py

WORKDIR /root
EXPOSE 8080
CMD ["jupyter", "notebook", "--no-browser", "--allow-root"]