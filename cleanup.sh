#! /bin/bash

. configuration

if [[ -n "$ARTICLES" ]] && [[ -n "$ARTICLES_PAGES" ]]
then
    echo $ARTICLES $ARTICLES_PAGES
    rm $ARTICLES/*
    rm $ARTICLES_PAGES/*
fi
