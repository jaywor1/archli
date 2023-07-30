#!/bin/bash

printf "Movie: "
read $MOVIE

curl https://www.google.com/search?q=$MOVIE+titulky.com+yify
