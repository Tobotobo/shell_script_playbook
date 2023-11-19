# ログを表示する　※装飾無し用
function log() {
  echo "$(date +"%Y/%m/%d %H:%M:%S") $1"
}

# 情報メッセージを表示する
function info() {
  echo "${cyan}$(date +"%Y/%m/%d %H:%M:%S") [INFO] $1${reset}"
}

# 警告メッセージを表示する
function warn() {
  echo "${yellow}$(date +"%Y/%m/%d %H:%M:%S") [WARN] $1${reset}"
}

# 成功メッセージを表示する
function ok() {
  echo "${green}$(date +"%Y/%m/%d %H:%M:%S") [OK] $1${reset}"
}

# 成功メッセージを表示する
function success() {
  echo "${green}$(date +"%Y/%m/%d %H:%M:%S") [SUCCESS] $1${reset}"
}

# エラーメッセージを表示する
function error() {
  echo "${red}$(date +"%Y/%m/%d %H:%M:%S") [ERROR] $1${reset}">&2
}

# 失敗メッセージを表示する　※表示のみでエラーは発生させない
function ng() {
  echo "${red}$(date +"%Y/%m/%d %H:%M:%S") [NG] $1${reset}">&2
}








