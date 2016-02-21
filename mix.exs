defmodule PhoenixSimpleForm.Mixfile do
  use Mix.Project

  def project do
    [app: :phoenix_simple_form,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: package,
     description: description,
     deps: deps]
  end

  defp description do
    """
    Easier form handling for phoenix
    """
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:phoenix_html, ">= 2.4.0"}]
  end

  defp package do
    [
      maintainers: ["Sascha Brink"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/sbrink/phoenix_simple_form"}
    ]
  end
end
