defmodule OpenAPIv3Validator.MixProject do
  use Mix.Project

  def project do
    [
      app: :openapiv3_validator,
      version: "0.1.0",
      elixir: "~> 1.1",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      pacakge: package(),
      description: description(),
      package: package(),

      # Docs
      docs: [
        # name: "OpenAPIv3Validator",
        main: "OpenAPIv3Validator",
        source_url: "https://github.com/mimicry-tech/openapi_validator"
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_json_schema, "~> 0.9.1"},

      # docs
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
      {:credo, "~> 1.4", only: [:dev, :test], runtime: false}
    ]
  end

  defp description do
    """
    a library to validate OpenAPIv3 specs quickly without resorting to run through the Swagger Editor
    """
  end

  defp package do
    [
      name: :openapiv3_validator,
      files: [
        "lib/",
        "mix.exs",
        "README*",
        "LICENSE*",
        "CHANGELOG*"
      ],
      maintainers: [
        "Florian Kraft"
      ],
      licenses: ["Apache License 2.0"],
      links: %{
        "GitHub" => "https://github.com/mimicry-tech/openapi_validator"
      }
    ]
  end
end
