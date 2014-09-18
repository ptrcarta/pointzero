### GENERATE THE ARTICLE BLOCK ###

commentstrip

varparse $1 time
varparse $1 title

function varparse {

#$1 is the file to parse
#$2 is the keyword to parse for
local key=$2
local result=$(grep -m1 "$key:" $1 | sed 's/$key:\(.*\)/\1/')

$2=$result

}
