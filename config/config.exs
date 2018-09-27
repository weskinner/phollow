# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phollow,
  ecto_repos: [Phollow.Repo],
  backend_api_key: {:system, :string, "BACKEND_API_KEY"},
  backend_url: "https://api.phish.net/v3"

# Configures the endpoint
config :phollow, PhollowWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "AFkpTZNIhbM5D9WhXF+2sWNGsmvxS0ThC0N3TO+v3qA4suRT82V8NSMUWPB81s0b",
  render_errors: [view: PhollowWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Phollow.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
