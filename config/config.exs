# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ten_thousand_dollar_homepage,
  ecto_repos: [TenThousandDollarHomepage.Repo]

# Configures the endpoint
config :ten_thousand_dollar_homepage, TenThousandDollarHomepageWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cOSPNbMkf3hTF7+LbWAKjZ0GpNBUnamjiWyqUm1v23752n5uvbfphq7b6eZM9soM",
  render_errors: [view: TenThousandDollarHomepageWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TenThousandDollarHomepage.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "WCTB1p1+AGLiVZnjtoF6A65rDd2jSmE1"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
