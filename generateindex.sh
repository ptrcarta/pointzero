echo "INITIATING generateindex.sh" >&2

cat templates/header.html
cat <<EOF
<article>
    <h1>Index</h1>
    <ul>
EOF


for post in `cat $1`
do
    time=$(echo $post | awk '{print $1}')
    link=$(echo $post | awk '{print $2}')
    posttitle=$(echo $post | sed 's/<h1>\(.*\)<\/h1>/\1/')
    cat <<EOF
    <li><a href="$link">$posttitle<a>
    <span class=pub-date>$(date -jf"%s" $time +"%F") </span>
    </li>
EOF
done

cat <<EOF
    </ul>
</article>
EOF

cat templates/footer.html
