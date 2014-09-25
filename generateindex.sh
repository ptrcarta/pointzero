echo "INITIATING generateindex.sh" >&2

cat templates/header.html
cat <<EOF
<article>
    <h1>Index</h1>
    <ul>
EOF


while read post
do
    time=$(echo $post | awk '{print $1}')
    link=$(echo $post | awk '{print $2}'| sed 's/\.block/.html/' | xargs basename)
    posttitle=$(echo $post | sed 's/.*<h1>\(.*\)<\/h1>/\1/')
    #FIX THE LINKS IN PRODUCTION
    cat <<EOF
    <li><a href="articles/$link">$posttitle</a>
    <span class=pub-date>$(date -d \@$time +"%F") </span>
    </li>
EOF
done <$1

cat <<EOF
    </ul>
</article>
EOF

cat templates/footer.html
