FROM openjdk:8-jdk

MAINTAINER Exakat, Damien Seguy, dseguy@exakat.io


RUN \
    echo "====> Gremlin 3" \
    && apt-get update \
    && apt-get install -y maven \
    && git clone https://github.com/thinkaurelius/neo4j-gremlin-plugin \
    && cd neo4j-gremlin-plugin \
    && sed -i.bak s_\<tinkerpop-version\>3.1.0-incubating\</tinkerpop-version\>_\<tinkerpop-version\>3.2.0-incubating\</tinkerpop-version\>_ tinkerpop3/pom.xml \
    && mvn clean package -DskipTests -Dtp.version=3 \
    && unzip target/neo4j-gremlin-plugin-tp3-2.3.1-server-plugin.zip -d neo4j-gremlin-plugin


CMD ["cp", "-avr", "neo4j-gremlin-plugin/neo4j-gremlin-plugin", "/mnt/"]
