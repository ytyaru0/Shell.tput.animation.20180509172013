Wait3(){
    local text='日本語を一文字ずつ表示する。この度はお疲れ様でした。'
    echo "$text" | fold -s1
    local char=''
    #local chars=`echo "$text" | fold -s1`
    #for char in "$chars"; do
    for char in `echo "$text" | fold -s1`; do
        echo -n $char
        sleep 0.05
    done
}
Wait3
