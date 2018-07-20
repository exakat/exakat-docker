FROM exakat/gremlin

MAINTAINER Exakat, Damien Seguy, dseguy@exakat.io

ENV EXAKAT_VERSION 1.3.6
ENV EXAKAT_URI http://dist.exakat.io/index.php?file=exakat-$EXAKAT_VERSION.phar

COPY exakat.sh /usr/src/exakat/
COPY gsneo4j.3.3.yaml /usr/src/exakat/
COPY config/exakat.ini /usr/src/exakat/config/
COPY projects /usr/src/exakat/projects
COPY docs/ /docs/

RUN \
    echo "===> Setup PHP" \
    && apk add --no-cache bash curl \
    && echo "===> PHP 7.2" \
    && apk add --update 'php7>7.2' 'php7-curl>7.2' 'php7-json>7.2' 'php7-phar>7.2' \
       'php7-sqlite3>7.2' 'php7-mbstring>7.2' 'php7-tokenizer>7.2' \
    \
    && echo "===> php.ini" \
    && echo "memory_limit=-1" >> /etc/php7/php.ini \
    \
    && echo "====> Gremlin-Server" \
    && cp -r /tinkergraph /usr/src/exakat/tinkergraph \
    && mv /usr/src/exakat/gsneo4j.3.3.yaml /usr/src/exakat/tinkergraph/conf/ \
    \
    && echo "===> Setup Exakat" \
    && apk add --no-cache curl curl-dev grep findutils ncurses libbsd=0.8.6-r2 \
    && echo "====> Exakat $EXAKAT_VERSION" \
    && cd /usr/src/exakat \
    && curl --fail --silent --show-error --location --output exakat.phar $EXAKAT_URI \
    && chmod a+x /usr/src/exakat/exakat.* \
    \
    && echo "====> Cleanup" \
    && apk del curl-dev curl \
    && rm -rf /var/cache/apk/* \
    \
    && echo "====> Permissions" \
    && adduser -u 2004 -D docker \
    && chown -R docker:docker /docs \
    && chown -R docker:docker /usr/src/exakat \
    && GREMLIN_HOME=''

WORKDIR /usr/src/exakat

ENTRYPOINT [ "/usr/src/exakat/exakat.sh" ]
