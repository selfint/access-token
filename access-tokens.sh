#!/bin/sh

if [ "$#" -ne 2 ]; then
    echo "Usage: $(basename $0) <command> <token-path>"
    exit 1
fi

if [ "$1" = "add" ]; then
    if [ -e "$2" ]; then
        echo Token path already exists: $2
        exit 1
    fi
    
    # make sure token parent dir exists
    token_dir=$(dirname "$2")
    if [ ! -d "$token_dir" ]; then 
        mkdir -p $token_dir
        echo Created empty directory: $token_dir
    fi
    unset token_dir
    
    # add token
    read -s -p "Enter access token value:" token_value
    echo
    echo $token_value | openssl aes-256-cbc -a -salt > $2
    unset token_value
 
elif [ "$1" = "view" ]; then
    cat $2 | openssl aes-256-cbc -a -salt -d

else
    echo Bad command: $1
    echo Commands: add/view
    exit 1
fi
