load_lib hello_world

a=1
assert $a -eq 1
# assert $a -eq 2

# 各タスクを実行
run_task say_hello_world

run_task task1

run_task task2
