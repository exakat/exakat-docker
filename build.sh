#Building
docker build --no-cache -t exakat/exakat:1.0.0 .

#Check for installation
docker run -it --rm exakat/exakat:1.0.0 doctor

#Running Exakat
rm -rf projects/sculpin
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.0.0 init -p sculpin -R https://github.com/sculpin/sculpin.git -v
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.0.0 project -p sculpin -v


rm -rf projects/ice
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.0.0 init -p ice -R https://bitbucket.org/ifacesoft/ice -hg -v
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.0.0 project -p ice -v

rm -rf projects/fry
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.0.0 init -p fry -R https://svn.code.sf.net/p/fry/code -svn -v
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.0.0 project -p fry -v




