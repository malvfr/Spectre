# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :spectre,
  ecto_repos: [Spectre.Repo]

# Configures the endpoint
config :spectre, SpectreWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KXqQfPywUvAEmZ56Dz8mbxrpg8RkCrap3WkHCwZ8XqgwObbPZBob7vs4r+vB5Xkd",
  render_errors: [view: SpectreWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Spectre.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "1vdqkCt4"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
