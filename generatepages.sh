echo "INITIATE generatepages.sh" >&2

POSTSXPAGE=3

articles=$(wc -l sortedlist)
pages=$((articles/POSTSXPAGE))

count=1

for line in $(cat sortedlist)
do

#########################################################
#  if [ $count % $POSTSXPAGE = 1 ] occurs only when
#  we are at the first post of each page
#########################################################
    if [ $count % $POSTSXPAGE = 1 ]
    then
        file="blogpage((count/POSTSXPAGE)).html"
        cat header.html >$BLOG_FOLDER/$file
    fi

## This is occurs for every post
    cat `echo $line | awk '{print $2}'` >>$BLOG_FOLDER/$file

## This happens after every last post in each page
    if [ $count % $POSTSXPAGE = 0 ]
    then
        pagescounter=0
        cat >>$BLOG_FOLDER/$file <<EOF
    <footer>
    <ul>
EOF
        while [[ $pagescounter -le $pages ]]
        do
            if [[ $((count/POSTSXPAGE)) = $pagescounter ]]
            then 
                echo "<li class=active>" >>$BLOG_FOLDER/$file
            else
                echo "<li>"  >>$BLOG_FOLDER/$file
            fi
            echo "<a href=$BLOG_FOLDER/blogpage${pagescounter}.html
            $pagescounter </a>"  >>$BLOG_FOLDER/$file
            echo "</li>" >>$BLOG_FOLDER/$file
            ((pagecounter++))
        done
        cat >>$BLOG_FOLDER/$file <<EOF
    </ul>
    </footer>
EOF

        cat footer.html >>$BLOG_FOLDER/$file
    fi

    ((count++))
done
