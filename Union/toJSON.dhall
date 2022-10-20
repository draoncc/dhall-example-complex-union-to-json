let Prelude = ../Prelude.dhall

let JSON = Prelude.JSON

let Union = ./Type.dhall

let Complex = ../Complex/package.dhall

let Union/toJSON
    : Union → JSON.Type
    = λ(union : Union) →
        merge
          { Complex = λ(c : Complex.Type) → Complex.toJSON c
          , Bool = λ(b : Bool) → JSON.bool b
          }
          union

in  Union/toJSON
