let Prelude = ../Prelude.dhall

let Map = Prelude.Map

let JSON = Prelude.JSON

let Complex = ./Type.dhall

let dropNones = ../utils/dropNones.dhall

let Optional/map = Prelude.Optional.map

in  let Complex/toJSON
        : Complex → JSON.Type
        = λ(complex : Complex) →
            let everything
                : Map.Type Text (Optional JSON.Type)
                = toMap
                    { a =
                        if    Prelude.List.null Text complex.a
                        then  None JSON.Type
                        else  Some
                                ( JSON.array
                                    ( Prelude.List.map
                                        Text
                                        JSON.Type
                                        JSON.string
                                        complex.a
                                    )
                                )
                    , b = Optional/map Natural JSON.Type JSON.natural complex.b
                    }

            in  JSON.object (dropNones Text JSON.Type everything)

    in  Complex/toJSON
