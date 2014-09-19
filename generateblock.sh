#!/bin/bash

### GENERATE THE ARTICLE BLOCK ###



file="`cat $1`"

#strip comments
file=$(cat <<<"$file" | sed 's/#.*//')

time=$(cat <<<"$file" | grep -m1 "TIME" | sed 's/TIME \(.*\)/\1/')
file=$(cat <<<"$file" | sed '0,/^TIME/s/^TIME.*//')

title=$(cat <<<"$file" | grep -m1 "TITLE" $1 | sed 's/TITLE \(.*\)/\1/')
file=$(cat <<<"$file" | sed '0,/^TITLE/s/^TITLE.*//')

filetitle=$(echo $title | sed 's/[\s]*$//g' | sed 's/[^a-zA-Z0-9]/_/g')
timestamp=$(date -jf"%F %H:%M" "$time" +"%s")

echo $filetitle
echo $timestamp


echo "        <article>"
echo "            <time>$time</time>"
echo "            <h1>$title</h1>"
cat <<<"$file"
echo "        </article>"
