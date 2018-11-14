#Building
docker build --no-cache -t exakat/exakat:1.5.3 .

#Check for installation
docker run -it --rm exakat/exakat:1.5.3 doctor

#Running Exakat
rm -rf projects/sculpin
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.5.3 init -p sculpin -R https://github.com/sculpin/sculpin.git -v
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.5.3 project -p sculpin -v
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.5.3 report -p sculpin -format Ambassador 

docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.5.3 init -p owncloud -R https://github.com/owncloud/core.git -v
docker run -it --rm -e JAVA_OPTIONS="-Xms32m -Xmx2512m" -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.5.3 project -p owncloud -v
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.5.3 report -p owncloud -format Ambassador 



docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.5.3 codacy -p codacy 

rm -rf projects/ice
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.5.3 init -p ice -R https://bitbucket.org/ifacesoft/ice -hg -v
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.5.3 project -p ice -v

rm -rf projects/fry
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.5.3 init -p fry -R https://svn.code.sf.net/p/fry/code -svn -v
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.5.3 project -p fry -v


#Interactive
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects --entrypoint /bin/bash exakat/exakat:1.5.3


