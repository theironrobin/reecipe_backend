# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :reecipe_backend,
  ecto_repos: [ReecipeBackend.Repo]

# Configures the endpoint
config :reecipe_backend, ReecipeBackendWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "t9q/TtYLVRC4JV5eEYiGhGrSAvvWqDpaqlE61k2LCNOgM4Ccpr3s6jt7a4np6v1A",
  render_errors: [view: ReecipeBackendWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ReecipeBackend.PubSub,
  live_view: [signing_salt: "3CeePNRc"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
