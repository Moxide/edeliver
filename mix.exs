defmodule Edeliver.Mixfile do
  use Mix.Project

  def project do
    [
      app: :edeliver,
      version: "1.3.0",
      description:  "Build and Deploy Elixir Applications and perform Hot-Code Upgrades and Schema Migrations",
      elixirc_paths: elixirc_paths,
      package: [
        licenses: ["MIT"],
        files:  [
          "bin",
          "CHANGELOG.md",
          "lib",
          "libexec",
          "mix.exs",
          "src",
          "strategies",
          "README.md",
        ],
        links: %{"GitHub" => "https://github.com/boldpoker/edeliver"},
      ],
      deps: deps,
      docs: docs,
    ]
  end

  def application, do:
    [applications: [],
     mod: {Edeliver, []},
     registered: [Edeliver.Supervisor, Edeliver],
     env: []
   ]

  defp deps do
    [
      {:distillery, ">= 0.9.0", warn_missing: false},
      {:meck, "~> 0.8.4", only: :test},
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.11.5", only: :dev},
    ]
  end

  defp docs, do: [
    logo: "docs/logo.png",
    extras: [
      "README.md": [title: "Usage"],
      "docs/auto-versioning.md": [title: "Auto-Versioning"],
      "docs/relup-patching.md": [title: "Relup-Patching"],
    ]
  ]

  defp elixirc_paths do

    [ Path.join("lib", "distillery"),
      Path.join("lib", "edeliver"),
      Path.join("lib", "mix"),
      Path.join("lib", "edeliver.ex"),
    ]
  end

end
