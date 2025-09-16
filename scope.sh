#!/bin/bash

a=3   # global

fun(){
    b=10   # actually global unless we use local
    echo "Inside function: a=$a, b=$b"
}

echo "Before calling fun: b=$b"   # empty
fun
echo "After calling fun: b=$b"    # 10



x=5   # global

fun(){
    x=10   # modifies global x!
    echo "Inside function: x=$x"
}

echo "Before calling fun: x=$x"
fun
echo "After calling fun: x=$x"
