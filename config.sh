#!/bin/sh

# define variables here

#1
url=${SERVICE_URL:-"http://localhost:3000"}
#2
#3

#Runtime configuration file name
file=./runtime.js

#remove file on exists
[ -f $file ] && rm $file

echo "window['runtime'] = {" >> $file

# continue writing envronment variables here
# 1
echo "\"SERVICE_URL\":\"$url\"" >> $file
# 2
# 3

echo "}" >> $file

# copy file to serve folder
cp -f $file /usr/share/nginx/html/

# Start NGINX
nginx -g 'daemon off;'

