FROM develar/java

MAINTAINER Exakat, Damien Seguy, dseguy@exakat.io


ENV NEO4J_VERSION 2.3.10
ENV NEO4J_EDITION community
ENV NEO4J_DOWNLOAD_SHA256 b910ca32c454dd3aa2870d2d9f83973c9597ab67b7f72355091ca2d924d646ab
ENV NEO4J_DOWNLOAD_ROOT http://dist.neo4j.org
ENV NEO4J_TARBALL neo4j-$NEO4J_EDITION-$NEO4J_VERSION-unix.tar.gz
ENV NEO4J_URI $NEO4J_DOWNLOAD_ROOT/$NEO4J_TARBALL
ENV NEO4J_HOME /var/lib/neo4j


COPY neo4j-gremlin-plugin/ $NEO4J_HOME/plugins/gremlin-plugin


RUN \
    echo "===> Setup" \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk add --no-cache bash curl \
    && echo "===> PHP 7.1" \
    && apk add --update 'php7>7.1' 'php7-xml>7.1' 'php7-xsl>7.1' 'php7-pdo_mysql>7.1' \
    'php7-mcrypt>7.1' 'php7-curl>7.1' 'php7-json>7.1' 'php7-fpm>7.1' 'php7-phar>7.1' 'php7-openssl>7.1' \
    'php7-mysqlnd>7.1' 'php7-ctype>7.1' 'php7-sqlite3>7.1' 'php7-mbstring>7.1' \
    \
    && echo "===> php.ini" \
    && echo "memory_limit=-1" >> /etc/php7/php.ini \
    \
    && export TERM="xterm" \
    \
    && echo "===> Neo4j" \
    && curl --fail --silent --show-error --location --output lsof.apk http://dl-3.alpinelinux.org/alpine/v3.0/main/x86_64/lsof-4.87-r0.apk \
    && apk add --quiet --allow-untrusted lsof.apk \
    && rm lsof.apk \
    \
    && curl --fail --silent --show-error --location --output neo4j.tar.gz $NEO4J_URI \
    && echo "$NEO4J_DOWNLOAD_SHA256  neo4j.tar.gz" | sha256sum -c -s - \
    && tar -xzf neo4j.tar.gz -C /var/lib \
    && rm -rf /var/lib/neo4j-*/plugins \
    && mv /var/lib/neo4j-*/* $NEO4J_HOME \
    && rm neo4j.tar.gz \
    && sed -i.bak s/dbms\.security\.auth_enabled=true/dbms\.security\.auth_enabled=false/ $NEO4J_HOME/conf/neo4j-server.properties \
    && sed -i.bak s%#org.neo4j.server.thirdparty_jaxrs_classes=org.neo4j.examples.server.unmanaged=/examples/unmanaged%org.neo4j.server.thirdparty_jaxrs_classes=com.thinkaurelius.neo4j.plugins=/tp% $NEO4J_HOME/conf/neo4j-server.properties \
    && sed -i.bak s%org.neo4j.server.webserver.port=7474%org.neo4j.server.webserver.port=7777% $NEO4J_HOME/conf/neo4j-server.properties \
    && rm $NEO4J_HOME/conf/neo4j-server.properties.bak \
    \
    && echo "====> Cleanup" \
    && apk del curl \
    && rm -rf /var/cache/apk/* \
    \
    && echo "====> Permissions" \
    && adduser -u 2004 -D docker \
    && chown -R docker:docker $NEO4J_HOME
