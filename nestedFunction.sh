sum(){
    echo "Addition is: "$(($1 + $2))

    sub(){
        echo "Difference is: " $(($1 - $2))
    }
    sub 8 9
}

sum 10 20