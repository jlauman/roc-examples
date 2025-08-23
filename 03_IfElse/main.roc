app [main!] { cli: platform "https://github.com/roc-lang/basic-cli/releases/download/0.19.0/Hj-J_zxz7V9YurCSTFcFdu6cQJie4guzsPMUi5kBYUk.tar.br" }

import cli.Stdout
import cli.Arg exposing [Arg]

main! : List Arg => Result {} _
main! = |_args|
    number = 3
    Stdout.line!("${Num.to_str(number)} is ${sign_word(number)}")

sign_word = |n|
    if n > 0 then
        "positive"
    else if n < 0 then
        "negative"
    else
        "neutral"

expect
    "positive" == sign_word(1)

expect
    "negative" == sign_word(-1)

expect
    # this will fail...
    "zero" == sign_word(0)
