FROM ubuntu:latest
 
# update
RUN apt-get -y update && apt-get install -y \
sudo \
wget \
vim
 
#install anaconda3
WORKDIR /opt
# download anaconda package and install anaconda
# archive -> https://repo.continuum.io/archive/
RUN wget https://repo.continuum.io/archive/Anaconda3-2019.10-Linux-x86_64.sh && \
sh /opt/Anaconda3-2019.10-Linux-x86_64.sh -b -p /opt/anaconda3 && \
rm -f Anaconda3-2019.10-Linux-x86_64.sh
# set path
ENV PATH /opt/anaconda3/bin:$PATH
 
# update pip and conda
RUN pip install --upgrade pip
 
# install OpenCV
RUN apt-get update
RUN apt-get install -y libsm6 libxext6 libxrender-dev libglib2.0-0
RUN pip install opencv-python

# install pulp
RUN pip install pulp

# install ortoolpy
RUN pip install ortoolpy
 
WORKDIR /
RUN mkdir /work
 
# execute jupyterlab as a default command
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]
