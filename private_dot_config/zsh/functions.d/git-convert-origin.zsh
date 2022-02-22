#!/usr/bin/env zsh

#
#    git-convert-origin
#
# Converts the cwd from HTPPS to git protocol.

git-convert-origin(){

    echo "Convert an https origin to git protocol... \n"

    if git config --get remote.origin.url | grep '\.git$' >/dev/null; then 
        newURL=`git config --get remote.origin.url | sed -r 's#(http.*://)([^/]+)/(.+)$#git@\2:\3#g'`
    else
        newURL=`git config --get remote.origin.url | sed -r 's#(http.*://)([^/]+)/(.+)$#git@\2:\3.git#g'`
    fi;

    echo "Does this new url look fine? (y/n) : " $newURL
    read response
    if [[ "$response" == "y" ]]; then 
        git remote set-url origin $newURL; 
        echo "Git remote updated."; 
    else 
        echo "Git remote unchanged."; 
    fi;
}