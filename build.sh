#Building
docker build --no-cache -t exakat/exakat:0.10.2 .

#Check for installation
docker run -it --rm exakat/exakat:latest doctor

#Running Exakat
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:latest init -p sculpin -R https://github.com/sculpin/sculpin.git -v
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:latest project -p sculpin -v


