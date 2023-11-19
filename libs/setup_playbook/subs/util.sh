# 指定の文言で y/n の入力を取得する
# 戻り値: y = 0, n = 1
# y/n 以外の入力は再入力を求める
function ask_yes_no {
  while true; do
    echo -n "${magenta}$(date +"%Y/%m/%d %H:%M:%S") [ASK] $*${reset}"
    read ans
    case $ans in
      [Yy]*)
        return 0
        ;;
      [Nn]*)
        return 1
        ;;
      *)
        echo "${red}y または n を入力してください。${reset}"
        ;;
    esac
  done
}

# 呼び出し元のスクリプトの直下にある .env を読み込む
function load_env_file() {
  info ".env の読み込みを開始しました。"
  env_file_path=${playbook_dir}/.env
  if [[ -f "${env_file_path}" ]]; then
    source "${env_file_path}"
    success ".env の読み込みが完了しました。"
  else
    warn ".env が見つからなかったため .env の読み込みをスキップしました。"
  fi
}

function load_lib() {
  local lib_name=$1
  local lib_file_path=${libs_dir}/${lib_name}/main.sh
  source "${lib_file_path}"
}
