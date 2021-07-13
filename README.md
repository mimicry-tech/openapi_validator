# OpenAPIv3Validator

A small library for validating OpenAPI specs independently of the [Swagger Editor](https://editor.swagger.io) - and independently of JavaScript.

Originally extracted from a branch of [mimicry](https://github.com/mimicry-tech/mimicry) as this might be useful to others.

## Installation

The package can be installedby adding `openapiv3_validator` to your list ofdependencies in `mix.exs`:

```elixir
def deps do
  [
    {:openapiv3_validator, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/openapi_validator](https://hexdocs.pm/openapiv3_validator).

## Usage

The package provides the openapi v3 schema as a plain elixir struct, so you can either:

```elixir
my_specification = %{}

my_specification |> OpenAPIv3Validator.valid?
# true / false

my_specification |> OpenAPIv3Validator/validate
# :ok | {:error, []}
```

This uses the most excellent `ex_json_schema`, you can also grab the schema directly and use it with `ex_json_schema`s `Validator`:

```elixir
alias OpenAPIv3Validator.Schemas.OpenAPI.V3, as: V3
alias ExJson.{Schema, Validator}

my_specification = %{
  "openapi" => "3.0.0",
  # ...
}

V3.schema() |> Schema.resolve |> Validator.valid?(my_specification)
```


