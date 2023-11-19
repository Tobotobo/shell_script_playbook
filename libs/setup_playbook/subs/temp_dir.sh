# 一時フォルダパスの初期化　※create_temp_dir()で設定
temp_dir=

# /tmp 内に一時フォルダを作成する
function create_temp_dir() {
  info "一時フォルダの作成を開始しました。"

  if [ -d "$temp_dir" ]; then
    warn "既に作成済みです。"
  else
    temp_dir=$(mktemp -d /tmp/${root_filename_without_ext}.XXXXXX)
    log $temp_dir
    success "一時フォルダの作成が完了しました。"
  fi
}

# 一時フォルダを削除する
function remove_temp_dir() {
  if [ -d "$temp_dir" ]; then
    info "一時フォルダの削除を開始しました。"
    log $temp_dir
    rm -r "$temp_dir"
    if [ $? -eq 0 ]; then
        success "一時フォルダの削除が完了しました。"
    else
        error "一時フォルダの削除に失敗しました。"
    fi
  fi
}
