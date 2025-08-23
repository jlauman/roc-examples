app [main!] { cli: platform "https://github.com/roc-lang/basic-cli/releases/download/0.19.0/Hj-J_zxz7V9YurCSTFcFdu6cQJie4guzsPMUi5kBYUk.tar.br" }

import cli.Stdout
import cli.Arg exposing [Arg]

# records are not objects -- they do not have methods or inheritance.
counts = {
    birds: 5,
    iguanas: 7,
}

main! : List Arg => Result {} _
main! = |_args|
    _ = Stdout.line!("Total animals is ${add_and_to_str(counts)}.")
    Stdout.line!("There are ${Num.to_str(get_birds(counts))} birds.")

add_and_to_str = |record|
    Num.to_str(record.birds + record.iguanas)

destructure_add_and_to_str = |{ birds: n1, iguanas: n2 }|
    Num.to_str(n1 + n2)

# record shorthand for a function that returns a record field.
# get_birds = |record| record.birds
get_birds = .birds

expect
    # field order does not matter in records.
    { iguanas: 7, birds: 5 } == counts

# expect
#    # the following is a type mismatch and will be caught by the compiler.
#    { iguanas: 7, birds: 5, capybaras: 3 } == counts

expect
    # extra fields are allowed in record
    counts2 = {
        birds: 2,
        iguanas: 3,
        capybaras: 4,
    }
    "5" == add_and_to_str(counts2)

expect
    # use function that destructures the record
    counts3 = {
        birds: 4,
        iguanas: 5,
        capybaras: 6,
    }
    "9" == destructure_add_and_to_str(counts3)

expect
    # construct a record from an existing record.
    # new fields cannot be added.
    counts4 = { counts & iguanas: 0 }
    counts4
    == {
        birds: 5,
        iguanas: 0,
    }
