#! /bin/bash

SEP="----------------------------"

echo "${SEP} file names ${SEP}"
find . -iname "*${1}*"
echo "${SEP} txt ${SEP}"
find . -name '*.txt' -print0 | xargs -0 grep -i --color --with-filename -n $@
echo "${SEP} html ${SEP}"
find . -name '*.html' -print0 | xargs -0 grep -i --color --with-filename -n $@
echo "${SEP} js ${SEP}"
find . -name '*.js' -print0 | xargs -0 grep -i --color --with-filename -n $@
echo "${SEP} php ${SEP}"
find . -name '*.php' -print0 | xargs -0 grep -i --color --with-filename -n $@
echo "${SEP} rb ${SEP}"
find . -name '*.rb' -print0 | xargs -0 grep -i --color --with-filename -n $@
echo "${SEP} py ${SEP}"
find . -name '*.py' -print0 | xargs -0 grep -i --color --with-filename -n $@
