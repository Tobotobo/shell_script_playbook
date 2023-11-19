# 指定のタスクを実行する
function run_task() {
    local task_name=$1
    info "${task_name} タスクの実行を開始しました。"
    local task_dir=${tasks_dir}/${task_name}
    local task_path=${task_dir}/main.sh
    disable_on_error
    (
      enable_on_error
      set_this_paths "${task_path}"
      source "${task_path}"
    )
    enable_on_error
    success "${task_name} タスクの実行が完了しました。"
}
