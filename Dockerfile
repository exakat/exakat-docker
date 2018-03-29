FROM develar/java

MAINTAINER Exakat, Damien Seguy, dseguy@exakat.io

ENV GREMLIN_VERSION 3.2.7
ENV GREMLIN_HOME /usr/src/exakat/tinkergraph
ENV EXAKAT_VERSION 1.2.0a
ENV EXAKAT_URI http://dist.exakat.io/index.php?file=exakat-$EXAKAT_VERSION.phar

COPY tinkergraph/ /usr/src/exakat/tinkergraph
COPY exakat.sh /usr/src/exakat/
COPY config/exakat.ini /usr/src/exakat/config/
COPY projects /usr/src/exakat/projects
COPY docs/ /docs/

RUN \
    echo "===> Setup PHP" \
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
    && echo "===> Setup Exakat" \
    && apk add --no-cache curl curl-dev grep findutils ncurses libbsd=0.8.6-r2 \
    && echo "====> Exakat $EXAKAT_VERSION" \
    && cd /usr/src/exakat \
    && curl --fail --silent --show-error --location --output exakat.phar $EXAKAT_URI \
    && chmod a+x /usr/src/exakat/exakat.* \
    && php exakat.phar doctor \
    \
    && echo "====> Cleanup" \
    && apk del curl-dev curl \
    && rm -rf /var/cache/apk/* \
    \
    && echo "====> Permissions" \
    && adduser -u 2004 -D docker \
    && chown -R docker:docker /docs \
    && chown -R docker:docker /usr/src/exakat

WORKDIR /usr/src/exakat

ENTRYPOINT [ "/usr/src/exakat/exakat.sh" ]
