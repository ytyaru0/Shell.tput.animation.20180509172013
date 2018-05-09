PrintChars(){ printf %${2}s | tr ' ' "$1"; }
# 右から左へテキストが来る
# $1 対象テキスト
ToLeft(){
    local cols=`tput cols`
    local count=$cols
    local len=${#1}
    while [ 0 -lt $count ]; do
        tput cuu 1
        #tput cub $(($col - $count))
        tput cub $(($col))
        local pre=`PrintChars ' ' $((col))`
        local target=${1:0:$(($cols-$count))}
        local suf=`PrintChars ' ' $((col))`
        echo "$pre$target$suf"
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
