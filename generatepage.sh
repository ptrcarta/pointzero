#!/bin/bash

cat templates/header.html

./generateblock.sh examples/examplepost

cat templates/footer.html
