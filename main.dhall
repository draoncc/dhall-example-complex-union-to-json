let Union = ./Union/Type.dhall

let Example = ./Example/package.dhall

let example =
      Example::{
      , foo = Some (Union.Complex { a = [ "one", "two" ], b = Some 3 })
      , bar = Some (Union.Bool True)
      }

let JSON/renderYAML = (./Prelude.dhall).JSON.renderYAML

in  JSON/renderYAML (Example.toJSON example)
