TO_DIR=$HOME/.cd
TO_DB=$TO_DIR/db

mkdir -p $TO_DIR

function get_dir() {
    grep "^${1}:" $TO_DB|cut -d: -f2-
}

function cd_bookmark () {
    echo "$1:$PWD" >> $TO_DB
}

function cd() {
    local dir
    if [ -d "$1" -o "$1" = "-" ]; then
        builtin cd "$1"
    elif [ -z "$1" ]; then
        builtin cd
    else
        dir=$(get_dir $1)
        if [ -n "$dir" ]; then
            echo "$dir"
            cd "$dir"
        else
            builtin cd "$1"
        fi
    fi
}
