Wait4(){
    local count=0
    while [ $count -lt ${#1} ]; do
        local target="${1:$count:1}"
        echo -n "$target"
        ((count++))
        sleep 0.05
    done
}
Wait4 "日本語を一文字ずつ表示する。この度はお疲れ様でした。"
