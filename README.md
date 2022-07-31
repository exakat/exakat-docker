# Exakat Docker Container

[Docker](https://www.docker.com) container and run [Exakat](https://www.exakat.io/) 2.4.0.

## Features

* [Exakat](https://www.exakat.io/) [`2.4.0`](https://github.com/exakat/exakat-ce.git)
* [PHP](https://php.net) 8.1 or 8.0
* [Gremlin Server 3.4.13](http://tinkerpop.apache.org/)
* VCS
	* [Git](https://git-scm.com/) 
	* [Mercurial](https://www.mercurial-scm.org/)
	* [Composer](https://getcomposer.org/)
	* [Bazaar](http://bazaar.canonical.com/en/)
	* [SVN](https://subversion.apache.org/).
	* [zip]

## Tags



## Installation

1. Install the exakat/exakat container:

    ``` sh
	$ docker pull exakat/exakat
	```

2. Run Exakat:

    ``` sh
	$ docker run -v $(pwd)/projects:/usr/src/exakat/projects --rm exakat/exakat exakat
    ```

3. Make commandline short cut for Exakat :

    ``` sh
    $ echo "#\!/bin/bash\ndocker run -it -v \$(pwd)/projects:/usr/src/exakat/projects --rm --name my-exakat exakat/exakat exakat \$@" > /usr/local/bin/exakat
    $ chmod u+x /usr/local/bin/exakat
    $ exakat version
    ```

## Dockerfile building

To build the Exakat dockerfile : 

1. Clone the source:

    ``` sh
	$ git clone https://github.com/exakat/exakat-docker.git
	$ cd exakat-docker
    ```

2. Build the container:

    ``` sh
	$ docker build --no-cache -t exakat/exakat:2.1.9 .
    ```

4. Test the Exakat container:

    ``` sh
    $ docker run -it -v $(pwd):/usr/src/exakat/projects --rm exakat/exakat exakat doctor
    $ docker run -it -v $(pwd):/usr/src/exakat/projects --rm exakat/exakat exakat init -p nlptools -R https://github.com/atrilla/nlptools.git -v
    $ docker run -it -v $(pwd):/usr/src/exakat/projects --rm exakat/exakat exakat project -v -p nlptools
	```
