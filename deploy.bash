#!/bin/bash

current_date_time="`date "+%Y-%m-%d %H:%M:%S"`";

#echo $current_date_time


if [ "$1" != "" ]; then
	msg="blog update $current_date_time: $1"
else
	msg="blog update $current_date_time"
fi


# echo $msg


#echo $msg

# update blog-contents
cd content/
git add * -A
git commit -m "$msg"
git push

# update hugo site generating settings
cd ..
#git add * -A
#git commit -m "$msg"
#git push

# generates hugo site
hugo

# update to leopardshadow.github.io
cd public
git add * -A
git commit -m "$msg"
git push

cd ..

git add *
git commit -m "$msg"
git push



