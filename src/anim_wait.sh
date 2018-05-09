PrintChars(){ printf %${2}s | tr ' ' "$1"; }
# 右から左へ１文字ずつ詰めて表示される
# $1 対象テキスト
ToLeft(){

    tput cub $(($col - ))

}
Wait(){
    local target=/tmp/work/chars.txt
    echo "日本語を一文字ずつ表示する。この度はお疲れ様でした。" > $target
    while IFS= read -rN1 char;
    do
        printf "$char";
        sleep 0.05;
    done < $target
    #done < echo $target
}
Wait

Wait2(){
    local text='helloworld!!'
    #local text='日本語を一文字ずつ表示する。この度はお疲れ様でした。'
    #echo "$text" | awk -v FS='' '{
    #    for (i = 1; i <= NF; i++) print $i;
    #}'
    echo "$text" | awk -v FS='' '{
        for (i = 1; i <= NF; i++) { sleep 1; printf $i; }
    }'
}
Wait2

Wait3(){
    #local text='helloworld!!'
    local text='日本語を一文字ずつ表示する。この度はお疲れ様でした。'
    #echo "$text" | awk -v FS='' '{
    #    for (i = 1; i <= NF; i++) print $i;
    #}'
    echo "$text" | fold -s1
    for char in `echo "$text" | fold -s1`; do
        echo -n $char
        sleep 0.05
    done
}
Wait3

Wait4(){
    local cols=`tput cols`
    local count=0
    while [ $count -lt ${#1} ]; do
        #tput cub $(($col - $count))
        tput cub $(($col))
        local pre=`PrintChars ' ' $((col))`
        local target=${1:0:$(($cols-$count))}
        local suf=`PrintChars ' ' $((col))`
        echo "$pre$target$suf"
        tput cuu 1
        #PrintChars ' ' $((col))
        ((count++))
        sleep 0.05
    done
    #tput cub $cols

}
Wait4 "日本語を一文字ずつ表示する。この度はお疲れ様でした。"
