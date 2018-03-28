FROM develar/java

MAINTAINER Exakat, Damien Seguy, dseguy@exakat.io

ENV GREMLIN_VERSION 3.2.7
ENV GREMLIN_HOME /usr/src/exakat/tinkergraph

COPY tinkergraph/ /usr/src/exakat/tinkergraph

RUN \
    echo "===> Setup" \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk add --no-cache bash curl \
    && echo "===> PHP 7.1" \
    && apk add --update 'php7>7.1' 'php7-curl>7.1' 'php7-json>7.1' 'php7-phar>7.1' \
       'php7-sqlite3>7.1' 'php7-mbstring>7.1' 'php7-tokenizer>7.1' \
    \
    && echo "===> php.ini" \
    && echo "memory_limit=-1" >> /etc/php7/php.ini \
    \
    && export TERM="xterm" \
    \
    && echo "====> Cleanup" \
    && apk del curl \
    && rm -rf /var/cache/apk/* \
    \
    && echo "====> Permissions" \
    && adduser -u 2004 -D docker \
    && chown -R docker:docker $GREMLIN_HOME
    
