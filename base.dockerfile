FROM develar/java

MAINTAINER Exakat, Damien Seguy, dseguy@exakat.io


ENV NEO4J_VERSION 2.3.9
ENV NEO4J_EDITION community
ENV NEO4J_DOWNLOAD_SHA256 044ed403776403f5c6a9b093d592b9b12d8964f605fb9e94f43408dca59202c3
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
    && apk add --update php7.1 php7.1-xml php7.1-xsl php7.1-pdo_mysql \
    php7.1-mcrypt php7.1-curl php7.1-json php7.1-fpm php7.1-phar php7.1-openssl \
    php7.1-mysqlnd php7.1-ctype php7.1-sqlite3 php7.1-mbstring \
    \
    && echo "===> php.ini" \
    && echo "memory_limit=-1" >> /etc/php7.1/php.ini \
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
