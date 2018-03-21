FROM exakat/base

MAINTAINER Exakat, Damien Seguy, dseguy@exakat.io


ENV EXAKAT_VERSION 1.1.9b
ENV EXAKAT_URI http://dist.exakat.io/index.php?file=exakat-$EXAKAT_VERSION.phar


COPY exakat.sh /usr/src/exakat/
COPY config/exakat.ini /usr/src/exakat/config/
COPY projects /usr/src/exakat/projects
COPY docs/ /docs/


RUN \
    echo "===> Setup" \
    && apk add --no-cache curl grep findutils ncurses libbsd=0.8.6-r2 \
    && echo "====> Exakat $EXAKAT_VERSION" \
    && cd /usr/src/exakat \
    && curl --fail --silent --show-error --location --output exakat.phar $EXAKAT_URI \
    && chmod a+x /usr/src/exakat/exakat.* \
    && ln -s /src /usr/src/exakat/projects/codacy/code \
    && php exakat.phar doctor \
    \
    && echo "====> Cleanup" \
    && apk del curl \
    && rm -rf /var/cache/apk/* \
    \
    && echo "====> Permissions" \
    && chown -R docker:docker /docs \
    && chown -R docker:docker /usr/src/exakat


WORKDIR /usr/src/exakat


ENTRYPOINT [ "/usr/src/exakat/exakat.sh" ]
