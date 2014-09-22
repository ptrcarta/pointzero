#!/bin/bash

. configuration

#compile to <article>
for inputfile in $POSTFILES_FOLDER/*
do
    ./generateblock.sh $inputfile
done

#list
    >bloglist
for article in $ARTICLES/*
do
    timestamp=$(grep -m 1 "<!-- TIME" $article  |\
        sed 's/.*TIME \([0-9]*\).*/\1/')
    articletitle=$(grep -m 1 "<h1>" $article  |\
        sed 's/<h1>\(.*\)<\/1>/\1/')

    echo $timestamp $article $articletitle >> bloglist
done

#sort
sort -n bloglist >sortedlist

#generate index

#generate pages

#generate individual articles


