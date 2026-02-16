# Accepts the following runtime arguments: the first argument is a path 
# to a directory on the filesystem, referred to below as filesdir; the second 
# argument is a text string which will be searched within these files, 
# referred to below as searchstr

# Exits with return value 1 error and print statements if any of the parameters 
# above were not specified

# Exits with return value 1 error and print statements if filesdir does not 
# represent a directory on the filesystem

# Prints a message "The number of files are X and the number of matching lines 
# are Y" where X is the number of files in the directory and all subdirectories 
# and Y is the number of matching lines found in respective files, where a matching 
# line refers to a line which contains searchstr (and may also contain additional 
# content).

#!/bin/sh
set -e
set -u

filesdir=$1
searchstr=$2

if [ $# -lt 2 ]
then
    echo "Missing parameters"
    exit 1
fi

if [ ! -d $filesdir ]
then
    echo "Invalid directory: $filesdir"
    exit 1
fi

numberOfFiles=$( find $filesdir -type f | wc -l )
numberOfMatches=$( grep -r $searchstr $filesdir | wc -l )

echo "The number of files are $numberOfFiles and the number of matching lines are $numberOfMatches"