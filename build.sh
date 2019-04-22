#Building
docker build --no-cache -t exakat/exakat:1.7.6 .

docker build --no-cache -t exakat/exakat-alpine:1.7.0 --file Dockerfile-alpine . 

docker build -t exakat/exakat:1.6.6 .

#Check for installation
docker run -it --rm exakat/exakat:1.6.6 doctor

#Running Exakat
rm -rf projects/sculpin
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.7.0 init -p sculpin -R https://github.com/sculpin/sculpin.git -v
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.7.0 project -p sculpin -v
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat-alpine:1.7.0 project -p sculpin -v
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.7.0 report -p sculpin -format Ambassador 

docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.6.6 init -p owncloud -R https://github.com/owncloud/core.git -v
docker run -it --rm -e JAVA_OPTIONS="-Xms32m -Xmx2512m" -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.6.6 project -p owncloud -v
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.6.6 report -p owncloud -format Ambassador 



docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.6.6 codacy -p codacy 

rm -rf projects/ice
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.6.6 init -p ice -R https://bitbucket.org/ifacesoft/ice -hg -v
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.6.6 project -p ice -v

rm -rf projects/fry
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.6.6 init -p fry -R https://svn.code.sf.net/p/fry/code -svn -v
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.6.6 project -p fry -v


#Interactive
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects --entrypoint /bin/bash exakat/exakat:1.7.0
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects --entrypoint /bin/bash exakat/base:3.3.4 
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects --entrypoint /bin/bash 3aed948e371b

docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects --entrypoint /bin/sh 79ba210fca70





docker build --no-cache -t exakat/base:3.3.4 .


docker run -it --rm -v /Users/famille/Desktop/analyzeG3/projects:/usr/src/exakat/projects exakat/exakat:1.6.6 project -p wstmall -v
docker run -it --rm -v /Users/famille/Desktop/analyzeG3/projects:/usr/src/exakat/projects exakat/exakat-alpine:1.6.6 project -p wstmall -v
