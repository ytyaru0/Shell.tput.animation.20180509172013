PrintChars(){ printf %${2}s | tr ' ' "$1"; }
# 右から左へテキストが来る
# $1 対象テキスト
ToLeft(){
    local cols=`tput cols`
    ((cols--))
    local count=$cols
    local len=${#1}
    while [ 0 -lt $count ]; do
        #tput cuu 1
        #tput cub $(($col - $count))
        #echo $(($cols-$count))
        local diff=$(($cols-$count))
        local pre=`PrintChars ' ' $((cols-$diff))`
        local target=${1:0:$diff}
        #local target=${1:0:$(($cols-$count))}
        local pretar=$pre$target
        local suf=''
        #local suf=`PrintChars 'S' $(($cols-${#pretar}))`
        #local suf=`PrintChars 'S' $((${#1}-col))`
        #local suf=`PrintChars 'S' $(($diff-${#1}))`
        #echo "$pre$target$suf"
        #tput cuu 1
        echo -n "$pre$target$suf"
        tput cub $cols
        #PrintChars ' ' $((col))
        ((count--))
        sleep 0.05
    done
    #tput cub $cols
}
ToLeft "日本語を表示する。"
# 右から左へ１文字ずつ詰めて表示される
# $1 対象テキスト
ToLeftChar(){
    tput cub $(($col - ))
}
