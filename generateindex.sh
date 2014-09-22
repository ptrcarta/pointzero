cat templates/header.html
cat <<EOF
<article>
    <h1>Index</h1>
    <ul>
EOF


for post in `cat sortedlist`
do
    time=$(echo $post | awk '{print $1}')
    link=$(echo $post | awk '{print $2}')
    posttitle=$(echo $post | awk '{print $3}')
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
