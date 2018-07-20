#!/bin/bash

ln -s /src /usr/src/exakat/projects/codacy/code

php exakat.phar cleandb -Q 
php exakat.phar codacy -file stdout
