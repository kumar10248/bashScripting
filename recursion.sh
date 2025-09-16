recursion() {
    if [ $1 -eq 1 ]; then
        echo "$1"
    else
        echo "$1"
        recursion $(( $1 - 1 ))
    fi
}

recursion 10
