#!/bin/bash
#https://stackoverflow.com/questions/529345/best-way-to-do-a-find-replace-in-several-files
#Complete example:

ag -l "$1" | xargs sed -i "" -e "s/$1/$2/g"

#If we break this down, what we get is:

# returns a list of files containing matching string
#ag -l "search string"

#Next, we have:

# consume the list of piped files and prepare to run foregoing command
# for each file delimited by newline
#xargs

#Finally, the string replacement command:

# -i '' means edit files in place and the '' means do not create a backup
# -e 's/from/to/g' specifies the command to run, in this case,
# global, search and replace

#sed -i '' -e 's/from/to/g'

