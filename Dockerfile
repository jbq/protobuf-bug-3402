FROM jbquenot/base-php:7.2.0-stretch

RUN apt-get update && apt-get -y install zip unzip php-pclzip gdb wget

ARG PROTOBUF_VERSION 
ARG PROTOC_VERSION

# Install protobuf extension
RUN pecl install protobuf-${PROTOBUF_VERSION}

# Install protobuf compiler (protoc)
RUN ( cd /tmp && wget https://github.com/google/protobuf/releases/download/v${PROTOC_VERSION}/protoc-${PROTOC_VERSION}-linux-x86_64.zip ) && \
    ( cd /usr/local && unzip /tmp/protoc-${PROTOC_VERSION}-linux-x86_64.zip )
