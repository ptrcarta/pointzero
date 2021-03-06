#!/bin/bash

### GENERATE THE ARTICLE BLOCK ###
echo "INITIATING generateblock.sh" >&2

file="`cat $1`"

#strip comments
file=$(cat <<<"$file" | sed 's/#.*//')

time=$(cat <<<"$file" | grep -m1 "TIME" | sed 's/TIME \(.*\)/\1/')
file=$(cat <<<"$file" | sed '0,/^TIME/s/^TIME.*//')

title=$(cat <<<"$file" | grep -m1 "TITLE" $1 | sed 's/TITLE \(.*\)/\1/')
file=$(cat <<<"$file" | sed '0,/^TITLE/s/^TITLE.*//')

filetitle=$(echo $title | sed 's/[\s]*$//g' | sed 's/[^a-zA-Z0-9]/_/g')
timestamp=$(date -d "$time" +"%s")

echo $filetitle
echo $timestamp


cat  >$ARTICLES/$filetitle.block <<EOF
<!-- TIME $timestamp -->
        <article>
            <time>$time</time>
            <h1>$title</h1>

$file

        <div class=permalink>Link to this article: <a href=http://carta.im/blog/articles/$filetitle.html>http://carta.im/blog/articles/$filetitle.html</a></div>
        </article>

EOF
