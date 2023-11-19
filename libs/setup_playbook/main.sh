#!/bin/bash

run_playbook() {
  # ./subs へのフルパス
  local subs_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/subs"

  # エラー処理
  source "${subs_dir}/error.sh"

  # 終了時の処理
  source "${subs_dir}/finally.sh"

  # 文字色の定義　※例）echo "${red}あいうえお${reset}"
  source "${subs_dir}/font_color.sh"

  # パス関連
  source "${subs_dir}/path.sh"

  # ログ関連
  source "${subs_dir}/log.sh"

  # Util
  source "${subs_dir}/util.sh"

  # 一時フォルダ関連
  source "${subs_dir}/temp_dir.sh"

  # タスク関連
  source "${subs_dir}/task.sh"

  # このスクリプトの各種パスを設定　※例) echo "${this_fullname}"
  set_this_paths $(get_caller_fullname)

  #########################################################################

  readonly playbook_name=$1
  shift
  readonly playbook_dir=${playbooks_dir}/${playbook_name}
  readonly playbook_fullname=${playbook_dir}/main.sh

  if [ ! -e "${playbook_fullname}" ]; then
    exit_status=PLAYBOOK_NOT_FOUND
    exit 1
  fi

  # -y オプションで実行確認をスキップ可能に
  local disabled_ask_yes_no=0
  for arg in "$@"; do
    case $arg in
      -y)
        disabled_ask_yes_no=1
        ;;
    esac
  done

  # 実行確認
  if (( ! disabled_ask_yes_no )) && ( ! ask_yes_no "${playbook_name} を実行します。よろしいですか？ [y/n]: " ); then
    # no の場合
    exit_status="CANCEL"
    exit 0
  fi

  # 処理開始
  info "${playbook_name} の処理を開始しました。"

  # .env ファイルの読込
  load_env_file

  # 一時フォルダを作成
  create_temp_dir

  # 対象の Playbook を実行
  disable_on_error
  (
    enable_on_error
    set_this_paths ${playbook_fullname}
    source ${playbook_fullname}
  )
  enable_on_error
}
