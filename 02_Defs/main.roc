app [main!] { cli: platform "https://github.com/roc-lang/basic-cli/releases/download/0.19.0/Hj-J_zxz7V9YurCSTFcFdu6cQJie4guzsPMUi5kBYUk.tar.br" }

import cli.Stdout
import cli.Arg exposing [Arg]

birds = 3

# defs are constant and cannot be reassigned.
# birds = 4

iguanas = 2

total = add_and_to_str(birds, iguanas)

main! : List Arg => Result {} _
main! = |_args|
    Stdout.line!("There are ${total} animals.")

add_and_to_str = |n1, n2|
    Num.to_str(n1 + n2)

expect
    "3" == add_and_to_str(1, 2)
