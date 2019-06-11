#Building
docker build --no-cache -t exakat/exakat:1.8.3-local .
docker images pull exakat/exakat:1.8.0 .

# docker images |grep -v REPOSITORY|awk '{print $1}'|xargs -L1 docker pull 


docker build --no-cache -t exakat/exakat:gitlab  --file Dockerfile-gitlab . 

docker build --no-cache -t exakat/base:3.3.6 .

docker build --no-cache -t exakat/gitlab  --file Dockerfile-gitlab . 
docker run -it --rm  --entrypoint /bin/sh exakat/exakat:1.7.8-local
docker run -it --rm  --entrypoint /bin/sh exakat/exakat:latest


docker build --no-cache -t exakat/exakat-alpine:1.7.0 --file Dockerfile-alpine . 

#Check for installation
docker run -it --rm exakat/exakat:1.7.8-local doctor
docker run -it --rm exakat/exakat:latest doctor

#Running Exakat
rm -rf projects/sculpin
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:latest init -p sculpin -R https://github.com/sculpin/sculpin.git -v
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:latest project -p sculpin -v
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat-alpine:1.7.0 project -p sculpin -v
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.7.0 report -p sculpin -format Ambassador 

docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.6.6 init -p owncloud -R https://github.com/owncloud/core.git -v
docker run -it --rm -e JAVA_OPTIONS="-Xms32m -Xmx2512m" -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.6.6 project -p owncloud -v
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.6.6 report -p owncloud -format Ambassador 



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


docker run -it --rm -w /src -v $(pwd)/projects/myself/code:/src --entrypoint "/usr/src/exakat/exakat.phar" exakat/exakat:latest  project -v



docker build --no-cache -t exakat/base:3.3.4 .


docker run -it --rm -v /Users/famille/Desktop/analyzeG3/projects:/usr/src/exakat/projects exakat/exakat:1.6.6 project -p wstmall -v
docker run -it --rm -v /Users/famille/Desktop/analyzeG3/projects:/usr/src/exakat/projects exakat/exakat-alpine:1.6.6 project -p wstmall -v

docker run -it --rm  --entrypoint /bin/sh sixlive/php-lint-fix
docker run -it --rm  --entrypoint /bin/sh exakat/exakat:gitlab


docker run -it --rm -w /src -v $(pwd)/projects/backbee/code:/src --entrypoint "/usr/src/exakat/exakat.phar" exakat/exakat:latest  project -v

docker run -it --rm -w /src -v $(pwd)/projects/backbee/code:/src exakat/exakat:latest project -v
docker run -it --rm -v $(pwd)/projects/backbee/code:/src exakat/exakat:latest project -v
docker run -it --rm -v $(pwd)/projects/backbee/code:/src exakat/exakat:1.7.8-local project -v

/usr/src/exakat/exakat.phar project -v


docker run -it --rm -w /src -v $(pwd):/src --entrypoint "/usr/src/exakat/exakat.phar" exakat/exakat:latest  project -v
