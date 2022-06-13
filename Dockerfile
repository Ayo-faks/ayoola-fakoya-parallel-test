FROM  ubuntu:22.04
ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"
ENV TZ=Africa/Kolkata \
    DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt install -y htop python3-dev wget libgtk2.0-dev language-pack-en

# Installing the sources for the locales
RUN apt-get install -y glibc-source

# Setting up the default locale to en_US.UTF-8
RUN  localedef --no-archive -i en_US -f UTF-8 en_US.UTF-8 && \
     export LANG=en_US.UTF-8

# Installing Necessary packages including firefox
RUN  apt install -y dbus-x11 
RUN apt install -y packagekit-gtk3-module 
RUN apt install -y libcanberra-gtk-module 
RUN apt install -y libcanberra-gtk3-module
RUN apt install -y firefox



RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir root/.conda \
    && sh Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh


RUN conda create -y -n mask python=3.6

COPY . src/
RUN /bin/bash -c "cd src \
    && source activate mask \
    && pip install -r requirements.txt"

# Starting Firefox application
CMD  /usr/bin/firefox

