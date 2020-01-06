FROM python:2-alpine
LABEL Author="Z.d. Peacock <zdp@thoomtech.com>"

# This needs to be set otherwise pycurl won't link correctly
ENV PYCURL_SSL_LIBRARY=openssl

RUN apk add --no-cache --update openssl curl \
    && apk add --no-cache --update --virtual .build-deps build-base python-dev curl-dev \
    && pip install jmespath jsonschema \
    && apk del .build-deps

# Install packages
RUN apk add --no-cache libcurl

# Needed for pycurl
ENV PYCURL_SSL_LIBRARY=openssl

# Install packages only needed for building, install and clean on a single layer
RUN apk add --no-cache --virtual .build-dependencies build-base curl-dev \
    && pip install pycurl \
    && apk del .build-dependencies

RUN git clone https://github.com/svanoort/pyresttest /root/pyresttest
RUN cd /root/pyresttest
RUN git remote add torchingloom https://github.com/torchingloom/pyresttest
RUN git pull --no-edit torchingloom master
RUN python setup.py install

WORKDIR /tests

ENTRYPOINT ["pyresttest"]
