#!/bin/sh 
    
# Runtime configuration file name
file=./runtime.js

#remove file on exists
[ -f $file ] && rm $file

echo "window['runtime'] = $config" >> $file
echo "$(cat <<EOM
    window['runtime'] =
        { 
            "SERVICE_URL" : "${SERVICE_URL:-"http://localhost:3000"}"
        }
EOM
)" > $file
    
    
# copy file to serve folder
cp -f $file /usr/share/nginx/html/