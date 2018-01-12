FROM songxitang/ubuntu:tensorflow
MAINTAINER songxitang <877646746@qq.com>

# add tensorflow serving
RUN apt-get install -y \
        build-essential \
        curl \
        libcurl3-dev \
        git \
        libfreetype6-dev \
        libpng12-dev \
        libzmq3-dev \
        pkg-config \
        software-properties-common \
        swig \
        zip \
        zlib1g-dev
RUN pip install tensorflow-serving-api
RUN echo "deb [arch=amd64] http://storage.googleapis.com/tensorflow-serving-apt stable tensorflow-model-server tensorflow-model-server-universal" | tee /etc/apt/sources.list.d/tensorflow-serving.list
RUN curl https://storage.googleapis.com/tensorflow-serving-apt/tensorflow-serving.release.pub.gpg | apt-key add -
RUN apt-get update && apt-get -y install tensorflow-model-server
RUN pip install --upgrade grpcio==1.7.3
RUN git clone https://github.com/tensorflow/serving.git
RUN wget http://yann.lecun.com/exdb/mnist/train-images-idx3-ubyte.gz -P /tmp
RUN wget http://yann.lecun.com/exdb/mnist/train-labels-idx1-ubyte.gz -P /tmp
RUN wget http://yann.lecun.com/exdb/mnist/t10k-images-idx3-ubyte.gz -P /tmp
RUN wget http://yann.lecun.com/exdb/mnist/t10k-labels-idx1-ubyte.gz -P /tmp