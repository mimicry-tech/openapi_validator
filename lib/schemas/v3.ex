defmodule OpenAPIv3Validator.Schemas.OpenAPI.V3 do
  @moduledoc """
  This represents the converted JSON Schema used to validate OpenAPI v3.0.x

  Converted from https://raw.githubusercontent.com/swagger-api/swagger-editor/master/src/plugins/json-schema-validator/oas3-schema.yaml
  """

  @schema %{
    "$schema" => "http://json-schema.org/draft-04/schema#",
    "additionalProperties" => false,
    "definitions" => %{
      "Encoding" => %{
        "additionalProperties" => false,
        "properties" => %{
          "allowReserved" => %{"default" => false, "type" => "boolean"},
          "contentType" => %{"type" => "string"},
          "explode" => %{"type" => "boolean"},
          "headers" => %{
            "additionalProperties" => %{"$ref" => "#/definitions/Header"},
            "type" => "object"
          },
          "style" => %{
            "enum" => ["form", "spaceDelimited", "pipeDelimited", "deepObject"],
            "type" => "string"
          }
        },
        "type" => "object"
      },
      "Parameter" => %{
        "additionalProperties" => false,
        "allOf" => [
          %{"$ref" => "#/definitions/ExampleXORExamples"},
          %{"$ref" => "#/definitions/SchemaXORContent"},
          %{"$ref" => "#/definitions/ParameterLocation"}
        ],
        "patternProperties" => %{"^x-" => %{}},
        "properties" => %{
          "allowEmptyValue" => %{"default" => false, "type" => "boolean"},
          "allowReserved" => %{"default" => false, "type" => "boolean"},
          "content" => %{
            "additionalProperties" => %{"$ref" => "#/definitions/MediaType"},
            "maxProperties" => 1,
            "minProperties" => 1,
            "type" => "object"
          },
          "deprecated" => %{"default" => false, "type" => "boolean"},
          "description" => %{"type" => "string"},
          "example" => %{},
          "examples" => %{
            "additionalProperties" => %{
              "switch" => [
                %{
                  "if" => %{"required" => ["$ref"]},
                  "then" => %{"$ref" => "#/definitions/Reference"}
                },
                %{"then" => %{"$ref" => "#/definitions/Example"}}
              ]
            },
            "type" => "object"
          },
          "explode" => %{"type" => "boolean"},
          "in" => %{"type" => "string"},
          "name" => %{"type" => "string"},
          "required" => %{"default" => false, "type" => "boolean"},
          "schema" => %{
            "switch" => [
              %{
                "if" => %{"required" => ["$ref"]},
                "then" => %{"$ref" => "#/definitions/Reference"}
              },
              %{"then" => %{"$ref" => "#/definitions/Schema"}}
            ]
          },
          "style" => %{"type" => "string"}
        },
        "required" => ["name", "in"],
        "type" => "object"
      },
      "Contact" => %{
        "additionalProperties" => false,
        "patternProperties" => %{"^x-" => %{}},
        "properties" => %{
          "email" => %{"format" => "email", "type" => "string"},
          "name" => %{"type" => "string"},
          "url" => %{"format" => "uri-reference", "type" => "string"}
        },
        "type" => "object"
      },
      "Reference" => %{
        "properties" => %{"$ref" => %{"format" => "uri-reference", "type" => "string"}},
        "required" => ["$ref"],
        "type" => "object"
      },
      "SecurityScheme" => %{
        "switch" => [
          %{
            "if" => %{
              "properties" => %{"type" => %{"enum" => ["apiKey"]}},
              "required" => ["type"]
            },
            "then" => %{"$ref" => "#/definitions/APIKeySecurityScheme"}
          },
          %{
            "if" => %{"properties" => %{"type" => %{"enum" => ["http"]}}, "required" => ["type"]},
            "then" => %{"$ref" => "#/definitions/HTTPSecurityScheme"}
          },
          %{
            "if" => %{
              "properties" => %{"type" => %{"enum" => ["oauth2"]}},
              "required" => ["type"]
            },
            "then" => %{"$ref" => "#/definitions/OAuth2SecurityScheme"}
          },
          %{
            "if" => %{
              "properties" => %{"type" => %{"enum" => ["openIdConnect"]}},
              "required" => ["type"]
            },
            "then" => %{"$ref" => "#/definitions/OpenIdConnectSecurityScheme"}
          },
          %{
            "then" => %{
              "properties" => %{
                "type" => %{
                  "enum" => ["apiKey", "http", "oauth2", "openIdConnect"],
                  "type" => "string"
                }
              },
              "required" => ["type"]
            }
          }
        ],
        "type" => "object"
      },
      "ParameterLocation" => %{
        "description" => "Parameter location",
        "switch" => [
          %{
            "if" => %{"properties" => %{"in" => %{"enum" => ["path"]}}, "required" => ["in"]},
            "then" => %{
              "description" => "Parameter in path",
              "properties" => %{
                "required" => %{"enum" => [true]},
                "style" => %{"default" => "simple", "enum" => ["matrix", "label", "simple"]}
              },
              "required" => ["required"]
            }
          },
          %{
            "if" => %{"properties" => %{"in" => %{"enum" => ["query"]}}, "required" => ["in"]},
            "then" => %{
              "description" => "Parameter in query",
              "properties" => %{
                "style" => %{
                  "default" => "form",
                  "enum" => ["form", "spaceDelimited", "pipeDelimited", "deepObject"]
                }
              }
            }
          },
          %{
            "if" => %{"properties" => %{"in" => %{"enum" => ["header"]}}, "required" => ["in"]},
            "then" => %{
              "description" => "Parameter in header",
              "properties" => %{"style" => %{"default" => "simple", "enum" => ["simple"]}}
            }
          },
          %{
            "if" => %{"properties" => %{"in" => %{"enum" => ["cookie"]}}, "required" => ["in"]},
            "then" => %{
              "description" => "Parameter in cookie",
              "properties" => %{"style" => %{"default" => "form", "enum" => ["form"]}}
            }
          },
          %{
            "then" => %{
              "properties" => %{"in" => %{"enum" => ["path", "query", "header", "cookie"]}},
              "required" => ["in"]
            }
          }
        ]
      },
      "RequestBody" => %{
        "additionalProperties" => false,
        "patternProperties" => %{"^x-" => %{}},
        "properties" => %{
          "content" => %{
            "additionalProperties" => %{"$ref" => "#/definitions/MediaType"},
            "type" => "object"
          },
          "description" => %{"type" => "string"},
          "required" => %{"default" => false, "type" => "boolean"}
        },
        "required" => ["content"],
        "type" => "object"
      },
      "Response" => %{
        "additionalProperties" => false,
        "patternProperties" => %{"^x-" => %{}},
        "properties" => %{
          "content" => %{
            "additionalProperties" => %{"$ref" => "#/definitions/MediaType"},
            "type" => "object"
          },
          "description" => %{"type" => "string"},
          "headers" => %{
            "additionalProperties" => %{
              "switch" => [
                %{
                  "if" => %{"required" => ["$ref"]},
                  "then" => %{"$ref" => "#/definitions/Reference"}
                },
                %{"then" => %{"$ref" => "#/definitions/Header"}}
              ]
            },
            "type" => "object"
          },
          "links" => %{
            "additionalProperties" => %{
              "switch" => [
                %{
                  "if" => %{"required" => ["$ref"]},
                  "then" => %{"$ref" => "#/definitions/Reference"}
                },
                %{"then" => %{"$ref" => "#/definitions/Link"}}
              ]
            },
            "type" => "object"
          }
        },
        "required" => ["description"],
        "type" => "object"
      },
      "License" => %{
        "additionalProperties" => false,
        "patternProperties" => %{"^x-" => %{}},
        "properties" => %{
          "name" => %{"type" => "string"},
          "url" => %{"format" => "uri-reference", "type" => "string"}
        },
        "required" => ["name"],
        "type" => "object"
      },
      "XML" => %{
        "additionalProperties" => false,
        "patternProperties" => %{"^x-" => %{}},
        "properties" => %{
          "attribute" => %{"default" => false, "type" => "boolean"},
          "name" => %{"type" => "string"},
          "namespace" => %{"format" => "uri", "type" => "string"},
          "prefix" => %{"type" => "string"},
          "wrapped" => %{"default" => false, "type" => "boolean"}
        },
        "type" => "object"
      },
      "Components" => %{
        "additionalProperties" => false,
        "patternProperties" => %{"^x-" => %{}},
        "properties" => %{
          "callbacks" => %{
            "patternProperties" => %{
              "^[a-zA-Z0-9\\.\\-_]+$" => %{
                "switch" => [
                  %{
                    "if" => %{"required" => ["$ref"]},
                    "then" => %{"$ref" => "#/definitions/Reference"}
                  },
                  %{"then" => %{"$ref" => "#/definitions/Callback"}}
                ]
              }
            },
            "type" => "object"
          },
          "examples" => %{
            "patternProperties" => %{
              "^[a-zA-Z0-9\\.\\-_]+$" => %{
                "switch" => [
                  %{
                    "if" => %{"required" => ["$ref"]},
                    "then" => %{"$ref" => "#/definitions/Reference"}
                  },
                  %{"then" => %{"$ref" => "#/definitions/Example"}}
                ]
              }
            },
            "type" => "object"
          },
          "headers" => %{
            "patternProperties" => %{
              "^[a-zA-Z0-9\\.\\-_]+$" => %{
                "switch" => [
                  %{
                    "if" => %{"required" => ["$ref"]},
                    "then" => %{"$ref" => "#/definitions/Reference"}
                  },
                  %{"then" => %{"$ref" => "#/definitions/Header"}}
                ]
              }
            },
            "type" => "object"
          },
          "links" => %{
            "patternProperties" => %{
              "^[a-zA-Z0-9\\.\\-_]+$" => %{
                "switch" => [
                  %{
                    "if" => %{"required" => ["$ref"]},
                    "then" => %{"$ref" => "#/definitions/Reference"}
                  },
                  %{"then" => %{"$ref" => "#/definitions/Link"}}
                ]
              }
            },
            "type" => "object"
          },
          "parameters" => %{
            "patternProperties" => %{
              "^[a-zA-Z0-9\\.\\-_]+$" => %{
                "switch" => [
                  %{
                    "if" => %{"required" => ["$ref"]},
                    "then" => %{"$ref" => "#/definitions/Reference"}
                  },
                  %{"then" => %{"$ref" => "#/definitions/Parameter"}}
                ]
              }
            },
            "type" => "object"
          },
          "requestBodies" => %{
            "patternProperties" => %{
              "^[a-zA-Z0-9\\.\\-_]+$" => %{
                "switch" => [
                  %{
                    "if" => %{"required" => ["$ref"]},
                    "then" => %{"$ref" => "#/definitions/Reference"}
                  },
                  %{"then" => %{"$ref" => "#/definitions/RequestBody"}}
                ]
              }
            },
            "type" => "object"
          },
          "responses" => %{
            "patternProperties" => %{
              "^[a-zA-Z0-9\\.\\-_]+$" => %{
                "switch" => [
                  %{
                    "if" => %{"required" => ["$ref"]},
                    "then" => %{"$ref" => "#/definitions/Reference"}
                  },
                  %{"then" => %{"$ref" => "#/definitions/Response"}}
                ]
              }
            },
            "type" => "object"
          },
          "schemas" => %{
            "patternProperties" => %{
              "^[a-zA-Z0-9\\.\\-_]+$" => %{
                "switch" => [
                  %{
                    "if" => %{"required" => ["$ref"]},
                    "then" => %{"$ref" => "#/definitions/Reference"}
                  },
                  %{"then" => %{"$ref" => "#/definitions/Schema"}}
                ]
              }
            },
            "type" => "object"
          },
          "securitySchemes" => %{
            "patternProperties" => %{
              "^[a-zA-Z0-9\\.\\-_]+$" => %{
                "switch" => [
                  %{
                    "if" => %{"required" => ["$ref"]},
                    "then" => %{"$ref" => "#/definitions/Reference"}
                  },
                  %{"then" => %{"$ref" => "#/definitions/SecurityScheme"}}
                ]
              }
            },
            "type" => "object"
          }
        },
        "type" => "object"
      },
      "Discriminator" => %{
        "properties" => %{
          "mapping" => %{"additionalProperties" => %{"type" => "string"}, "type" => "object"},
          "propertyName" => %{"type" => "string"}
        },
        "required" => ["propertyName"],
        "type" => "object"
      },
      "Info" => %{
        "additionalProperties" => false,
        "patternProperties" => %{"^x-" => %{}},
        "properties" => %{
          "contact" => %{"$ref" => "#/definitions/Contact"},
          "description" => %{"type" => "string"},
          "license" => %{"$ref" => "#/definitions/License"},
          "termsOfService" => %{"format" => "uri-reference", "type" => "string"},
          "title" => %{"type" => "string"},
          "version" => %{"type" => "string"}
        },
        "required" => ["title", "version"],
        "type" => "object"
      },
      "ServerVariable" => %{
        "additionalProperties" => false,
        "patternProperties" => %{"^x-" => %{}},
        "properties" => %{
          "default" => %{"type" => "string"},
          "description" => %{"type" => "string"},
          "enum" => %{"items" => %{"type" => "string"}, "type" => "array"}
        },
        "required" => ["default"],
        "type" => "object"
      },
      "PathItem" => %{
        "additionalProperties" => false,
        "patternProperties" => %{
          "^(get|put|post|delete|options|head|patch|trace)$" => %{
            "$ref" => "#/definitions/Operation"
          },
          "^x-" => %{}
        },
        "properties" => %{
          "$ref" => %{"type" => "string"},
          "description" => %{"type" => "string"},
          "parameters" => %{
            "items" => %{
              "switch" => [
                %{
                  "if" => %{"required" => ["$ref"]},
                  "then" => %{"$ref" => "#/definitions/Reference"}
                },
                %{"then" => %{"$ref" => "#/definitions/Parameter"}}
              ]
            },
            "type" => "array",
            "uniqueItems" => true
          },
          "servers" => %{"items" => %{"$ref" => "#/definitions/Server"}, "type" => "array"},
          "summary" => %{"type" => "string"}
        },
        "type" => "object"
      },
      "Paths" => %{
        "additionalProperties" => false,
        "errorMessage" => %{
          "additionalProperties" => "should only have path names that start with `/`"
        },
        "patternProperties" => %{"^\\/" => %{"$ref" => "#/definitions/PathItem"}, "^x-" => %{}},
        "type" => "object"
      },
      "SchemaXORContent" => %{
        "description" => "Schema and content are mutually exclusive, at least one is required",
        "errorMessage" => "should have either a `schema` or `content` property",
        "switch" => [
          %{"if" => %{"required" => ["schema", "content"]}, "then" => false},
          %{"if" => %{"required" => ["schema"]}, "then" => true},
          %{
            "if" => %{"required" => ["content"]},
            "then" => %{
              "allOf" => [
                %{"not" => %{"required" => ["style"]}},
                %{"not" => %{"required" => ["explode"]}},
                %{"not" => %{"required" => ["allowReserved"]}},
                %{"not" => %{"required" => ["example"]}},
                %{"not" => %{"required" => ["examples"]}}
              ],
              "description" => "Some properties are not allowed if content is present",
              "errorMessage" =>
                "should not have `style`, `explode`, `allowReserved`, `example`, or `examples` when `content` is present"
            }
          },
          %{"then" => %{"required" => ["schema", "content"]}}
        ]
      },
      "Header" => %{
        "additionalProperties" => false,
        "allOf" => [
          %{"$ref" => "#/definitions/ExampleXORExamples"},
          %{"$ref" => "#/definitions/SchemaXORContent"}
        ],
        "patternProperties" => %{"^x-" => %{}},
        "properties" => %{
          "allowEmptyValue" => %{"default" => false, "type" => "boolean"},
          "allowReserved" => %{"default" => false, "type" => "boolean"},
          "content" => %{
            "additionalProperties" => %{"$ref" => "#/definitions/MediaType"},
            "maxProperties" => 1,
            "minProperties" => 1,
            "type" => "object"
          },
          "deprecated" => %{"default" => false, "type" => "boolean"},
          "description" => %{"type" => "string"},
          "example" => %{},
          "examples" => %{
            "additionalProperties" => %{
              "switch" => [
                %{
                  "if" => %{"required" => ["$ref"]},
                  "then" => %{"$ref" => "#/definitions/Reference"}
                },
                %{"then" => %{"$ref" => "#/definitions/Example"}}
              ]
            },
            "type" => "object"
          },
          "explode" => %{"type" => "boolean"},
          "required" => %{"default" => false, "type" => "boolean"},
          "schema" => %{
            "switch" => [
              %{
                "if" => %{"required" => ["$ref"]},
                "then" => %{"$ref" => "#/definitions/Reference"}
              },
              %{"then" => %{"$ref" => "#/definitions/Schema"}}
            ]
          },
          "style" => %{"default" => "simple", "enum" => ["simple"], "type" => "string"}
        },
        "type" => "object"
      },
      "Callback" => %{
        "additionalProperties" => %{"$ref" => "#/definitions/PathItem"},
        "patternProperties" => %{"^x-" => %{}},
        "type" => "object"
      },
      "AuthorizationCodeOAuthFlow" => %{
        "additionalProperties" => false,
        "patternProperties" => %{"^x-" => %{}},
        "properties" => %{
          "authorizationUrl" => %{"format" => "uri-reference", "type" => "string"},
          "refreshUrl" => %{"format" => "uri-reference", "type" => "string"},
          "scopes" => %{"additionalProperties" => %{"type" => "string"}, "type" => "object"},
          "tokenUrl" => %{"format" => "uri-reference", "type" => "string"}
        },
        "required" => ["authorizationUrl", "tokenUrl"],
        "type" => "object"
      },
      "PasswordOAuthFlow" => %{
        "additionalProperties" => false,
        "patternProperties" => %{"^x-" => %{}},
        "properties" => %{
          "refreshUrl" => %{"format" => "uri-reference", "type" => "string"},
          "scopes" => %{"additionalProperties" => %{"type" => "string"}, "type" => "object"},
          "tokenUrl" => %{"format" => "uri-reference", "type" => "string"}
        },
        "required" => ["tokenUrl"],
        "type" => "object"
      },
      "Example" => %{
        "additionalProperties" => false,
        "patternProperties" => %{"^x-" => %{}},
        "properties" => %{
          "description" => %{"type" => "string"},
          "externalValue" => %{"format" => "uri-reference", "type" => "string"},
          "summary" => %{"type" => "string"},
          "value" => %{}
        },
        "type" => "object"
      },
      "OAuthFlows" => %{
        "additionalProperties" => false,
        "patternProperties" => %{"^x-" => %{}},
        "properties" => %{
          "authorizationCode" => %{"$ref" => "#/definitions/AuthorizationCodeOAuthFlow"},
          "clientCredentials" => %{"$ref" => "#/definitions/ClientCredentialsFlow"},
          "implicit" => %{"$ref" => "#/definitions/ImplicitOAuthFlow"},
          "password" => %{"$ref" => "#/definitions/PasswordOAuthFlow"}
        },
        "type" => "object"
      },
      "ExternalDocumentation" => %{
        "additionalProperties" => false,
        "patternProperties" => %{"^x-" => %{}},
        "properties" => %{
          "description" => %{"type" => "string"},
          "url" => %{"format" => "uri-reference", "type" => "string"}
        },
        "required" => ["url"],
        "type" => "object"
      },
      "Schema" => %{
        "additionalProperties" => false,
        "patternProperties" => %{"^x-" => %{}},
        "properties" => %{
          "title" => %{"type" => "string"},
          "items" => %{
            "switch" => [
              %{
                "if" => %{"required" => ["$ref"]},
                "then" => %{"$ref" => "#/definitions/Reference"}
              },
              %{"then" => %{"$ref" => "#/definitions/Schema"}}
            ]
          },
          "oneOf" => %{
            "items" => %{
              "switch" => [
                %{
                  "if" => %{"required" => ["$ref"]},
                  "then" => %{"$ref" => "#/definitions/Reference"}
                },
                %{"then" => %{"$ref" => "#/definitions/Schema"}}
              ]
            },
            "type" => "array"
          },
          "anyOf" => %{
            "items" => %{
              "switch" => [
                %{
                  "if" => %{"required" => ["$ref"]},
                  "then" => %{"$ref" => "#/definitions/Reference"}
                },
                %{"then" => %{"$ref" => "#/definitions/Schema"}}
              ]
            },
            "type" => "array"
          },
          "deprecated" => %{"default" => false, "type" => "boolean"},
          "type" => %{
            "enum" => ["array", "boolean", "integer", "number", "object", "string"],
            "type" => "string"
          },
          "maxLength" => %{"minimum" => 0, "type" => "integer"},
          "uniqueItems" => %{"default" => false, "type" => "boolean"},
          "exclusiveMaximum" => %{"default" => false, "type" => "boolean"},
          "readOnly" => %{"default" => false, "type" => "boolean"},
          "allOf" => %{
            "items" => %{
              "switch" => [
                %{
                  "if" => %{"required" => ["$ref"]},
                  "then" => %{"$ref" => "#/definitions/Reference"}
                },
                %{"then" => %{"$ref" => "#/definitions/Schema"}}
              ]
            },
            "type" => "array"
          },
          "minItems" => %{"default" => 0, "minimum" => 0, "type" => "integer"},
          "xml" => %{"$ref" => "#/definitions/XML"},
          "additionalProperties" => %{
            "default" => true,
            "switch" => [
              %{
                "if" => %{"required" => ["$ref"], "type" => "object"},
                "then" => %{"$ref" => "#/definitions/Reference"}
              },
              %{"if" => %{"type" => "object"}, "then" => %{"$ref" => "#/definitions/Schema"}},
              %{
                "then" => %{
                  "errorMessage" =>
                    "should be a Reference Object, Schema Object, or boolean value",
                  "type" => "boolean"
                }
              }
            ]
          },
          "required" => %{
            "errorMessage" => %{
              "type" => "should be an array of property names required within an object schema"
            },
            "items" => %{"type" => "string"},
            "minItems" => 1,
            "type" => "array",
            "uniqueItems" => true
          },
          "not" => %{
            "switch" => [
              %{
                "if" => %{"required" => ["$ref"]},
                "then" => %{"$ref" => "#/definitions/Reference"}
              },
              %{"then" => %{"$ref" => "#/definitions/Schema"}}
            ]
          },
          "example" => %{},
          "default" => %{},
          "multipleOf" => %{"exclusiveMinimum" => true, "minimum" => 0, "type" => "number"},
          "minimum" => %{"type" => "number"},
          "pattern" => %{"format" => "regex", "type" => "string"},
          "exclusiveMinimum" => %{"default" => false, "type" => "boolean"},
          "externalDocs" => %{"$ref" => "#/definitions/ExternalDocumentation"},
          "maxItems" => %{"minimum" => 0, "type" => "integer"},
          "maxProperties" => %{"minimum" => 0, "type" => "integer"},
          "nullable" => %{"default" => false, "type" => "boolean"},
          "description" => %{"type" => "string"},
          "minProperties" => %{"default" => 0, "minimum" => 0, "type" => "integer"},
          "properties" => %{
            "additionalProperties" => %{
              "switch" => [
                %{
                  "if" => %{"required" => ["$ref"]},
                  "then" => %{"$ref" => "#/definitions/Reference"}
                },
                %{"then" => %{"$ref" => "#/definitions/Schema"}}
              ]
            },
            "type" => "object"
          },
          "writeOnly" => %{"default" => false, "type" => "boolean"},
          "minLength" => %{"default" => 0, "minimum" => 0, "type" => "integer"},
          "format" => %{"type" => "string"},
          "maximum" => %{"type" => "number"},
          "discriminator" => %{"$ref" => "#/definitions/Discriminator"},
          "enum" => %{"items" => %{}, "minItems" => 1, "type" => "array", "uniqueItems" => false}
        },
        "type" => "object"
      },
      "ClientCredentialsFlow" => %{
        "additionalProperties" => false,
        "patternProperties" => %{"^x-" => %{}},
        "properties" => %{
          "refreshUrl" => %{"format" => "uri-reference", "type" => "string"},
          "scopes" => %{"additionalProperties" => %{"type" => "string"}, "type" => "object"},
          "tokenUrl" => %{"format" => "uri-reference", "type" => "string"}
        },
        "required" => ["tokenUrl"],
        "type" => "object"
      },
      "Server" => %{
        "additionalProperties" => false,
        "patternProperties" => %{"^x-" => %{}},
        "properties" => %{
          "description" => %{"type" => "string"},
          "url" => %{"type" => "string"},
          "variables" => %{
            "additionalProperties" => %{"$ref" => "#/definitions/ServerVariable"},
            "type" => "object"
          }
        },
        "required" => ["url"],
        "type" => "object"
      },
      "Tag" => %{
        "additionalProperties" => false,
        "patternProperties" => %{"^x-" => %{}},
        "properties" => %{
          "description" => %{"type" => "string"},
          "externalDocs" => %{"$ref" => "#/definitions/ExternalDocumentation"},
          "name" => %{"type" => "string"}
        },
        "required" => ["name"],
        "type" => "object"
      },
      "APIKeySecurityScheme" => %{
        "additionalProperties" => false,
        "patternProperties" => %{"^x-" => %{}},
        "properties" => %{
          "description" => %{"type" => "string"},
          "in" => %{"enum" => ["header", "query", "cookie"], "type" => "string"},
          "name" => %{"type" => "string"},
          "type" => %{"enum" => ["apiKey"], "type" => "string"}
        },
        "required" => ["type", "name", "in"],
        "type" => "object"
      },
      "Link" => %{
        "additionalProperties" => false,
        "not" => %{
          "description" => "Operation Id and Operation Ref are mutually exclusive",
          "required" => ["operationId", "operationRef"]
        },
        "patternProperties" => %{"^x-" => %{}},
        "properties" => %{
          "description" => %{"type" => "string"},
          "operationId" => %{"type" => "string"},
          "operationRef" => %{"format" => "uri-reference", "type" => "string"},
          "parameters" => %{"additionalProperties" => %{}, "type" => "object"},
          "requestBody" => %{},
          "server" => %{"$ref" => "#/definitions/Server"}
        },
        "type" => "object"
      },
      "Operation" => %{
        "additionalProperties" => false,
        "patternProperties" => %{"^x-" => %{}},
        "properties" => %{
          "callbacks" => %{
            "additionalProperties" => %{
              "switch" => [
                %{
                  "if" => %{"required" => ["$ref"]},
                  "then" => %{"$ref" => "#/definitions/Reference"}
                },
                %{"then" => %{"$ref" => "#/definitions/Callback"}}
              ]
            },
            "type" => "object"
          },
          "deprecated" => %{"default" => false, "type" => "boolean"},
          "description" => %{"type" => "string"},
          "externalDocs" => %{"$ref" => "#/definitions/ExternalDocumentation"},
          "operationId" => %{"type" => "string"},
          "parameters" => %{
            "items" => %{
              "switch" => [
                %{
                  "if" => %{"required" => ["$ref"]},
                  "then" => %{"$ref" => "#/definitions/Reference"}
                },
                %{"then" => %{"$ref" => "#/definitions/Parameter"}}
              ]
            },
            "type" => "array",
            "uniqueItems" => true
          },
          "requestBody" => %{
            "switch" => [
              %{
                "if" => %{"required" => ["$ref"]},
                "then" => %{"$ref" => "#/definitions/Reference"}
              },
              %{"then" => %{"$ref" => "#/definitions/RequestBody"}}
            ]
          },
          "responses" => %{"$ref" => "#/definitions/Responses"},
          "security" => %{
            "items" => %{"$ref" => "#/definitions/SecurityRequirement"},
            "type" => "array"
          },
          "servers" => %{"items" => %{"$ref" => "#/definitions/Server"}, "type" => "array"},
          "summary" => %{"type" => "string"},
          "tags" => %{"items" => %{"type" => "string"}, "type" => "array"}
        },
        "required" => ["responses"],
        "type" => "object"
      },
      "HTTPSecurityScheme" => %{
        "additionalProperties" => false,
        "patternProperties" => %{"^x-" => %{}},
        "properties" => %{
          "bearerFormat" => %{"type" => "string"},
          "description" => %{"type" => "string"},
          "scheme" => %{"type" => "string"},
          "type" => %{"enum" => ["http"], "type" => "string"}
        },
        "required" => ["scheme", "type"],
        "switch" => [
          %{
            "if" => %{
              "not" => %{
                "properties" => %{"scheme" => %{"enum" => ["bearer"]}},
                "required" => ["scheme"]
              }
            },
            "then" => %{
              "errorMessage" =>
                "should NOT have a `bearerFormat` property without `scheme: bearer` being set",
              "properties" => %{"bearerFormat" => %{"enum" => [nil]}}
            }
          }
        ],
        "type" => "object"
      },
      "ImplicitOAuthFlow" => %{
        "additionalProperties" => false,
        "patternProperties" => %{"^x-" => %{}},
        "properties" => %{
          "authorizationUrl" => %{"format" => "uri-reference", "type" => "string"},
          "refreshUrl" => %{"format" => "uri-reference", "type" => "string"},
          "scopes" => %{"additionalProperties" => %{"type" => "string"}, "type" => "object"}
        },
        "required" => ["authorizationUrl", "scopes"],
        "type" => "object"
      },
      "SecurityRequirement" => %{
        "additionalProperties" => %{"items" => %{"type" => "string"}, "type" => "array"},
        "type" => "object"
      },
      "Responses" => %{
        "additionalProperties" => false,
        "errorMessage" => %{
          "additionalProperties" =>
            "should only have three-digit status codes, `default`, and vendor extensions (`x-*`) as properties",
          "minProperties" => "should define at least one response",
          "not" =>
            "should define at least one response, in addition to any vendor extension (`x-*`) fields"
        },
        "minProperties" => 1,
        "not" => %{
          "additionalProperties" => false,
          "minProperties" => 1,
          "patternProperties" => %{"^x-" => %{}},
          "type" => "object"
        },
        "patternProperties" => %{
          "^[1-5](?:\\d{2}|XX)$" => %{
            "switch" => [
              %{
                "if" => %{"required" => ["$ref"]},
                "then" => %{"$ref" => "#/definitions/Reference"}
              },
              %{"then" => %{"$ref" => "#/definitions/Response"}}
            ]
          },
          "^x-" => %{}
        },
        "properties" => %{
          "default" => %{
            "switch" => [
              %{
                "if" => %{"required" => ["$ref"]},
                "then" => %{"$ref" => "#/definitions/Reference"}
              },
              %{"then" => %{"$ref" => "#/definitions/Response"}}
            ]
          }
        },
        "type" => "object"
      },
      "OAuth2SecurityScheme" => %{
        "additionalProperties" => false,
        "patternProperties" => %{"^x-" => %{}},
        "properties" => %{
          "description" => %{"type" => "string"},
          "flows" => %{"$ref" => "#/definitions/OAuthFlows"},
          "type" => %{"enum" => ["oauth2"], "type" => "string"}
        },
        "required" => ["type", "flows"],
        "type" => "object"
      },
      "OpenIdConnectSecurityScheme" => %{
        "additionalProperties" => false,
        "patternProperties" => %{"^x-" => %{}},
        "properties" => %{
          "description" => %{"type" => "string"},
          "openIdConnectUrl" => %{"format" => "uri-reference", "type" => "string"},
          "type" => %{"enum" => ["openIdConnect"], "type" => "string"}
        },
        "required" => ["type", "openIdConnectUrl"],
        "type" => "object"
      },
      "ExampleXORExamples" => %{
        "description" => "Example and examples are mutually exclusive",
        "errorMessage" =>
          "should not have both `example` and `examples`, as they are mutually exclusive",
        "not" => %{"required" => ["example", "examples"]}
      },
      "MediaType" => %{
        "additionalProperties" => false,
        "allOf" => [%{"$ref" => "#/definitions/ExampleXORExamples"}],
        "patternProperties" => %{"^x-" => %{}},
        "properties" => %{
          "encoding" => %{
            "additionalProperties" => %{"$ref" => "#/definitions/Encoding"},
            "type" => "object"
          },
          "example" => %{},
          "examples" => %{
            "additionalProperties" => %{
              "switch" => [
                %{
                  "if" => %{"required" => ["$ref"]},
                  "then" => %{"$ref" => "#/definitions/Reference"}
                },
                %{"then" => %{"$ref" => "#/definitions/Example"}}
              ]
            },
            "type" => "object"
          },
          "schema" => %{
            "switch" => [
              %{
                "if" => %{"required" => ["$ref"]},
                "then" => %{"$ref" => "#/definitions/Reference"}
              },
              %{"then" => %{"$ref" => "#/definitions/Schema"}}
            ]
          }
        },
        "type" => "object"
      }
    },
    "description" => "Validation schema for OpenAPI Specification 3.0.X.",
    "id" => "https://spec.openapis.org/oas/3.0/schema/2019-04-02",
    "patternProperties" => %{"^x-" => %{}},
    "properties" => %{
      "components" => %{"$ref" => "#/definitions/Components"},
      "externalDocs" => %{"$ref" => "#/definitions/ExternalDocumentation"},
      "info" => %{"$ref" => "#/definitions/Info"},
      "openapi" => %{"pattern" => "^3\\.0\\.\\d(-.+)?$", "type" => "string"},
      "paths" => %{"$ref" => "#/definitions/Paths"},
      "security" => %{
        "items" => %{"$ref" => "#/definitions/SecurityRequirement"},
        "type" => "array"
      },
      "servers" => %{"items" => %{"$ref" => "#/definitions/Server"}, "type" => "array"},
      "tags" => %{"items" => %{"$ref" => "#/definitions/Tag"}, "type" => "array"}
    },
    "required" => ["openapi", "info", "paths"],
    "type" => "object"
  }

  @doc """
  returns the static schema
  """
  def schema, do: @schema
end
