echo "INITIATE generatepermlink.sh" >&2

cat templates/header.html

./generateblock.sh $1 

cat templates/footer.html
