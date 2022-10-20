let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let Example = ./Type.dhall

let Union = ../Union/package.dhall

let dropNones = ../utils/dropNones.dhall

let Optional/map = Prelude.Optional.map

in  let Example/toJSON
        : Example → JSON.Type
        = λ(example : Example) →
            let everything
                : Map.Type Text (Optional JSON.Type)
                = toMap
                    { foo =
                        Optional/map
                          Union.Type
                          JSON.Type
                          Union.toJSON
                          example.foo
                    , bar =
                        Optional/map
                          Union.Type
                          JSON.Type
                          Union.toJSON
                          example.bar
                    , baz =
                        Optional/map
                          Union.Type
                          JSON.Type
                          Union.toJSON
                          example.baz
                    }

            in  JSON.object (dropNones Text JSON.Type everything)

    in  Example/toJSON
