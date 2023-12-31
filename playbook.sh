#!/bin/bash

if [[ $1 == "--download" ]]; then

  set -eu

  # ダウンロードするソースのURL
  src_url=$2

  # 実行対象のPlaybook名
  playbook_name=$3

  # 一時フォルダを作成
  temp_dir=$(mktemp -d /tmp/$(basename "${0%.*}").XXXXXX)

  # 終了時に一時フォルダを削除
  function on_exit() {
    rm -rf "${temp_dir}"
    rm -f "${temp_zip}"
  }
  trap on_exit EXIT

  # 一時フォルダにソースをダウンロード&解凍
  if [[ $src_url == *.zip ]]; then

    temp_zip="$(mktemp)"
    curl -f -H "Cache-Control: no-cache, no-store, must-revalidate" -H "Pragma: no-cache" -H "Expires: 0" \
      -o "${temp_zip}" -L "${src_url}"
    unzip -q -d "${temp_dir}" "${temp_zip}"
    first_dir=$(find "${temp_dir}" -mindepth 1 -maxdepth 1 -type d | head -n 1)
    mv "${first_dir}/"* "${temp_dir}/"

  elif [[ $src_url == *.tar.gz ]]; then

    curl -H "Cache-Control: no-cache, no-store, must-revalidate" -H "Pragma: no-cache" -H "Expires: 0" \
      -o - -L "${src_url}" | tar -zxf - -C "${temp_dir}" --strip-components=1

  else
    echo "ダウンロード対象のURLには zip または tar.gz へのURLを指定してください。"
    exit 1
  fi

  # 対象のPlaybookを実行
  shift 3
  bash "${temp_dir}/playbook.sh" "${playbook_name}" "$@"

else

  # 対象のPlaybookを実行
  source "$(dirname "$0")/libs/setup_playbook/main.sh"
  run_playbook "$@"

fi
