defmodule Ab.Mixfile do
  use Mix.Project

  def project do
    [app: :ab,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:bypass, git: "git@github.com:PSPDFKit-labs/bypass.git", only: :test},
      {:httpoison, "~> 0.9.0"},
      {:poison, "~> 2.0"}
    ]
  end
end
