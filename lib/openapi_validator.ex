defmodule OpenAPIv3Validator do
  @moduledoc """
  Documentation for `OpenAPIv3Validator`.

  The `OpenAPIv3Validator` provides functions to check whether or not a spec complies to the OpenAPIv3 specification.

  The JSON schema for the specification was converted from JSON to a map internally, see `OpenAPIv3Validator.Schemas.OpenAPI.V3`.

  Originally extracted from `Mimicry`, this can be used in place of running the open api validation through the swagger editor.
  """

  alias ExJsonSchema.{Schema, Validator}
  alias OpenAPIv3Validator.Schemas.OpenAPI.V3

  @doc """
  tests an input whether or not it will comply to the JSON schema for OpenAPIv3

  ## Examples

      
      iex> %{} |> OpenAPIv3Validator.valid?
      false

      iex> spec =%{
      iex>   "openapi" => "3.0.0",
      iex>   "paths" => %{},
      iex>   "info" => %{"title" => "Valid OpenAPIv3 spec", "version" => "1.0.0"}
      iex> }
      iex> spec |> OpenAPIv3Validator.valid?
      true
  """
  def valid?(input) do
    V3.schema()
    |> Schema.resolve()
    |> Validator.valid?(input)
  end

  @doc """
  tests an input on whether it's compliant to the OpenAPIv3 spec, returning the errors, if any

  ## Examples

      iex> %{} |> OpenAPIv3Validator.validate()
      {:error, [{"Required properties openapi, info, paths were not present.", "#"}]}

      iex> spec =%{
      iex>   "openapi" => "3.0.0",
      iex>   "paths" => %{},
      iex>   "info" => %{"title" => "Valid OpenAPIv3 spec", "version" => "1.0.0"}
      iex> }
      iex> spec |> OpenAPIv3Validator.validate()
      :ok
  """
  def validate(input) do
    V3.schema()
    |> Schema.resolve()
    |> Validator.validate(input)
  end
end
