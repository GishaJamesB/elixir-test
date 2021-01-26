# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :twt,
  ecto_repos: [Twt.Repo]

# Configures the endpoint
config :twt, TwtWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qpOc9Cy7ZOGrkVBa++f9lu174b9dpnIAT/hWK4MiOlDHp2z4NzvshlrUIGMQvOa7",
  render_errors: [view: TwtWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Twt.PubSub,
  live_view: [signing_salt: "mFEXf98O"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
