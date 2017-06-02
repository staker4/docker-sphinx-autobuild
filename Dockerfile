FROM ubuntu:xenial

MAINTAINER staker4

# Install apt packages
RUN apt-get update \
    && apt-get install -y python-pip \

# Clean downloaded apt packages after install
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \

# Install python packages
    && pip install  'sphinx              == 1.6.2' \
                    'sphinx-autobuild    == 0.6.0' \
                    'sphinx_rtd_theme    == 0.2.4'

# Set the locale
ENV   LANG C.UTF-8
ENV   LANGUAGE C.UTF-8
ENV   LC_ALL C.UTF-8

ENV SPHINX_AUTOBUILD_HOST 0.0.0.0
ENV SPHINX_AUTOBUILD_PORT 8000

EXPOSE $SPHINX_AUTOBUILD_PORT

VOLUME  /sphinx-doc

# Run autobuild
WORKDIR /sphinx-doc
ENTRYPOINT sphinx-autobuild -b html --host $SPHINX_AUTOBUILD_HOST --port $SPHINX_AUTOBUILD_PORT --poll /sphinx-doc /sphinx-doc/_build/html
