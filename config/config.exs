use Mix.Config

config :ab, github_api: "https://api.github.com/repos"

import_config "#{Mix.env}.exs"
