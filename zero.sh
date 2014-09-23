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
sort -rn bloglist >sortedlist

#generate index

./generateindex.sh sortedlist >$BLOG_FOLDER/index.html

#generate pages

./generatepages.sh

#generate individual articles

for article in $ARTICLES/*
do
    art_name=$(basename $article | sed 's/\.block//')
    ./generatepermlink.sh $article >$ARTICLES_PAGES/$art_name.html
done
