# shell_script_playbook

## 概要
Shell スクリプトで Ansible の PlayBook のようなものを目指す。

## 機能
- エラー発生時にスクリプト停止 + スタックトレースの表示
- 便利な関数
- 

## 使い方
- tasks フォルダ内に実行したいタスクの名前でフォルダを作る
- ↑ に main.sh を追加して実行したいタスクを記述する
- playbooks フォルダ内に実行したいタスクをまとめる Playbook の名前でフォルダを作る
- ↑ に main.sh を追加して実行したいタスクを列挙する
- Playbook の名前で以下のように実行する　※Playbook の名前=hello_world_playbook の場合
  ```
  ./playbook.sh hello_world_playbook
  ```

## ダウンロード実行
```
bash <(curl -f -s -H "Cache-Control: no-cache, no-store, must-revalidate" -H "Pragma: no-cache" -H "Expires: 0" \
  "https://raw.githubusercontent.com/Tobotobo/shell_script_playbook/main/playbook.sh") \
  --download \
  "https://github.com/Tobotobo/shell_script_playbook/archive/refs/heads/main.zip" \
  "hello_world_playbook"
```

## 関数一覧

| 関数名 | 説明 |
| :--- | :--- |
| run_task $1 | $1=タスク名(tasksフォルダ内のフォルダ名)。指定のタスクを実行する。 |
| load_lib $1 | $1=ライブラリ名(libsフォルダ内のフォルダ名)。指定のライブラリを読み込む。(=実行する) |
| log $1 | $1=出力する文字列。stdout に `yyyy/MM/dd hh:mm:ss $1` で出力する。 |
| info $1 |  |
| warn $1 |  |
| ok $1 |  |
| success $1 |  |
| error $1 |  |
| ng $1 |  |
| raise $1 $2 |  |
| assert $1 |  |
|  |  |

## 変数一覧
| 変数名 | 説明 |
| :--- | :--- |
| root_dir | playbook.sh のあるフォルダのフルパス |
| libs_dir | libs フォルダのフルパス |
| playbooks_dir | playbooks フォルダのフルパス |
| tasks_dir | tasks フォルダのフルパス |
| playbook_name | 実行した Playbook の名前 |
| playbook_dir | 実行した Playbook のフォルダのフルパス |
| task_name | 実行した Task の名前 |
| task_dir | 実行した Task のフォルダのフルパス |
|  |  |

## TODO
- -yとか固定に引数の参照を固定に　→　エラー強化
- playbook-download　←　別ファイルにしないとlibsが参照できない？うまいことやったらいけるか？
- Playbook -> Task1 -> Task2 callerを配列で辿れるように
