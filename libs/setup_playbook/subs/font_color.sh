# 文字に色を付ける　※例）echo "${red}あいうえお${reset}"
readonly red=$(printf '\033')[31m     # 赤
readonly green=$(printf '\033')[32m   # 緑
readonly yellow=$(printf '\033')[33m  # 黄
readonly blue=$(printf '\033')[34m    # 青
readonly magenta=$(printf '\033')[35m # マゼンタ
readonly cyan=$(printf '\033')[36m    # シアン
readonly reset=$(printf '\033')[00m   # リセット
