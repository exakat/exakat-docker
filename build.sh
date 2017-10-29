#Building
docker build --no-cache -t exakat/exakat:1.0.0 .

#Check for installation
docker run -it --rm exakat/exakat:1.0.0 doctor

#Running Exakat
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.0.0 init -p sculpin -R https://github.com/sculpin/sculpin.git -v
docker run -it --rm -v $(pwd)/projects:/usr/src/exakat/projects exakat/exakat:1.0.0 project -p sculpin -v


