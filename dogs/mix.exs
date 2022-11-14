defmodule Dogs.MixProject do
  use Mix.Project

  def project do
    [
      app: :dogs,
      version: "0.1.0",
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Dogs.Application, []}
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
      {:mix_test_watch, "~> 1.0", only: :dev, runtime: false},
      {:arc, "~> 0.11.0"},
      {:arc_ecto, "~> 0.11.3"},
      {:waffle, "~> 1.1"},
      {:waffle_ecto, "~> 0.0"},
      {:ex_aws, "~> 2.4"},
      {:ex_aws_s3, "~> 2.3.3"},
      {:hackney, "~> 1.6"},
      {:poison, "~> 3.1"},
      {:sweet_xml, "~> 0.6"},
      {:plug_cowboy, "~> 2.5"},
      {:jason, "~> 1.4"},
      {:uuid, "~> 1.1"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp aliases do
    [
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
