# 指定されたパスの絶対パスを返す
function get_fullname() {
  echo $(cd $(dirname $1); pwd)/$(basename "$1")
}

# ※不完全なので通常利用禁止
function get_relative_path() {
  local absolute="$1"
  local base="$root_dir"
  local relative=""

  while [[ $absolute != $base* ]]; do
      base=$(dirname "$base")
      relative="../${relative}"
  done

  local base_suffix="${absolute#$base/}"
  if [[ -z $base_suffix ]]; then
      echo "."
  else
      echo "${relative}${base_suffix}"
  fi
}

# 指定されたパスからフォルダパスを返す
function get_dir() {
  echo $(dirname "$1")
}

# 指定されたパスからファイル名を返す
function get_filename() {
  echo $(basename "$1")
}

# 指定されたパスからファイル名(拡張子無し)を返す
function get_filename_without_ext() {
  echo $(basename "${1%.*}")
}

# 呼び出し元のスクリプトのフルパスを取得する
function get_caller_fullname() {
  echo "$(get_fullname "${BASH_SOURCE[0]}")"
}

# 指定のパスを各 this_XXXX に設定する
function set_this_paths() {
  local path="$1"

  # 呼び出し元のスクリプトのフルパス
  this_fullname=$(get_fullname "${path}")

  # 呼び出し元のスクリプトがあるフォルダのフルパス
  this_dir=$(get_dir "${this_fullname}")

  # 呼び出し元のスクリプトファイル名
  this_filename=$(get_filename "${this_fullname}")

  # 呼び出し元のスクリプトファイル名（拡張子を除く）
  this_filename_without_ext=$(get_filename_without_ext "${this_fullname}")
}

#################################################################################

# root スクリプトのフルパス
readonly root_fullname=$(get_fullname "$0")

# root スクリプトがあるフォルダのフルパス
readonly root_dir=$(get_dir "${root_fullname}")

# root スクリプトファイル名
readonly root_filename=$(get_filename "${root_fullname}")

# root スクリプトファイル名（拡張子を除く）
readonly root_filename_without_ext=$(get_filename_without_ext "${root_fullname}")

readonly libs_dir=${root_dir}/libs

readonly tasks_dir=${root_dir}/tasks

readonly playbooks_dir=${root_dir}/playbooks

