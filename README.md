#PointZero static blog builder
Bash blog builder. You feed it a date and the raw html for the content of each blog article and it builds individual and indexed pages.

##Dependencies
I try to keep this low dependencies.
Apart from bash, it makes use of gnu-sed or ssed specific functions. on OSX/*BSD default sed won't cut it.
This script also relies on the date unix util. It is now set to use GNU version. need to change the syntax for BSD version

