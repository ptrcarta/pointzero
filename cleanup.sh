#! /bin/bash

. configuration

if [[ -n "$ARTICLES" ]] && [[ -n "$ARTICLES_PAGES" ]] \
    && [[ -n "BLOG_FOLDER" ]]
then
    echo $ARTICLES $ARTICLES_PAGES $BLOG_FOLDER
    rm $BLOG_FOLDER/blogpage*
    rm $BLOG_FOLDER/index.html
    rm $ARTICLES/*
    rm $ARTICLES_PAGES/*
fi
