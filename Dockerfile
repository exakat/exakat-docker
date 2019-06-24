FROM php:7.3-cli-stretch

LABEL MAINTAINER Exakat, Damien Seguy, dseguy@exakat.io
ENV EXAKAT_VERSION 1.8.5
ENV GREMLIN_VERSION 3.3.7

COPY exakat.sh /usr/src/exakat/
COPY config/exakat.ini /usr/src/exakat/config/

RUN \
    echo "====> Exakat $EXAKAT_VERSION" && \
    mkdir -p /usr/src/exakat && \
    cd /usr/src/exakat && \
    \
    echo "===> php.ini" && \
    echo "memory_limit=-1" >> /usr/local/etc/php/php.ini && \
    \
    echo "===> Java 8"  && \
    mkdir -p /usr/share/man/man1 && \
    apt-get update && \
    apt-get install -y default-jre && \
    \
    apt-get install -y --no-install-recommends procps git subversion mercurial bzr lsof unzip zip && \
    \
    echo "===> Composer"  && \
    curl -sS https://getcomposer.org/installer -o composer-setup.php && \
    HASH="$(curl --silent -o - https://composer.github.io/installer.sig)" && \
    php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    \
    echo "====> Gremlin-Server" && \
    curl --silent -o apache-tinkerpop-gremlin-server-$GREMLIN_VERSION-bin.zip http://dist.exakat.io/apache-tinkerpop-gremlin-server-$GREMLIN_VERSION-bin.zip && \
    unzip apache-tinkerpop-gremlin-server-$GREMLIN_VERSION-bin.zip && \
    mv apache-tinkerpop-gremlin-server-$GREMLIN_VERSION tinkergraph && \
    rm -rf apache-tinkerpop-gremlin-server-$GREMLIN_VERSION-bin.zip  && \
    cd tinkergraph && \
    bin/gremlin-server.sh install org.apache.tinkerpop neo4j-gremlin $GREMLIN_VERSION && \
    cd .. && \
    \
    echo "====> Exakat $EXAKAT_VERSION" && \
    cd /usr/src/exakat && \
    curl --silent http://dist.exakat.io/index.php?file=exakat-$EXAKAT_VERSION.phar -o exakat.phar && \
    chmod a+x /usr/src/exakat/exakat.* && \
    \
    echo "====> Cleanup" && \
    \
    apt-get clean && \
    rm -rf /var/cache/oracle-jdk8-installer  && \
    rm -rf /var/lib/apt/lists/* && \
    ln -s /usr/src/exakat/exakat.phar /usr/local/bin/exakat && \
    exakat doctor

CMD [ "exakat", "doctor" ]
