echo "INITIATE generatepages.sh" >&2

POSTSXPAGE=3

articles=$(wc -l sortedlist | awk '{print $1}')
pages=$(($articles/$POSTSXPAGE))

count=1

while read line
do

#########################################################
#  if [[ $(($count % $POSTSXPAGE )) = 1 ]] occurs only when
#  we are at the first post of each page
#########################################################
    if [[ $(($count % $POSTSXPAGE)) == 1 ]]
    then
        file="blogpage$((count/ POSTSXPAGE)).html"
        cat templates/header.html >$BLOG_FOLDER/$file
    fi

## This is occurs for every post
    cat `echo $line | awk '{print $2}'` >>$BLOG_FOLDER/$file


## This happens after every last post in each page
if [[ $(( $count % $POSTSXPAGE )) == 0 ]]
    then
        pagescounter=0

        cat >>$BLOG_FOLDER/$file <<EOF
    <footer>
    <ul>
EOF

        while [[ $pagescounter -lt $pages ]]
        do
            if [[ $((($count-1)/$POSTSXPAGE)) = $pagescounter ]]
            then 
                echo "<li class=active>" >>$BLOG_FOLDER/$file
            else
                echo "<li>"  >>$BLOG_FOLDER/$file
            fi
            echo "<a href=blogpage${pagescounter}.html> $pagescounter </a>"  >>$BLOG_FOLDER/$file
            echo "</li>" >>$BLOG_FOLDER/$file

            ((pagescounter++))
        done
        cat >>$BLOG_FOLDER/$file <<EOF
    </ul>
    </footer>
EOF

        cat templates/footer.html >>$BLOG_FOLDER/$file
    fi

    ((count++))
done <sortedlist
