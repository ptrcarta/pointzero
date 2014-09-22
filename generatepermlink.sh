#!/bin/bash

cat templates/header.html

./generateblock.sh $1 

cat templates/footer.html
