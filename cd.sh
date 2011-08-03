TO_DIR=$HOME/.cd
TO_DB=$TO_DIR/db

mkdir -p $TO_DIR

function cd_bookmark () {
    echo "$1:$PWD" >> $TO_DB
}

function cd() {
    if [ -d "$1" -o "$1" = "-" ]; then
        builtin cd "$1"
    elif [ -z "$1" ]; then
        builtin cd
    else
        dir=$(grep ^$1: $TO_DB|cut -d: -f2)
        if [ -n "$dir" ]; then
            echo "$dir"
            cd "$dir"
        else
            builtin cd "$1"
        fi
    fi
}
