defmodule ShakespeareBrowser.Mixfile do
  use Mix.Project

  def project do
    [app: :shakespeareBrowser,
     version: "0.0.1",
     build_path: "../../_build",
     config_path: "../../config/config.exs",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :tirexs]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # To depend on another app inside the umbrella:
  #
  #   {:myapp, in_umbrella: true}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
    {:tirexs, "~> 0.8"},
    {:poison, "~> 3.0"},
    {:credo, "~> 0.8", only: [:dev, :test], runtime: false}
    ]
  end

  defp aliases do
    [
      test: ["credo", "test --cover"], # to be able to test partially i.e.: `mix test test/inventory_scenario_test.exs:90`
    ]
  end
end
