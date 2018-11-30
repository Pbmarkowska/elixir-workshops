# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :facelixir,
  ecto_repos: [Facelixir.Repo]

# Configures the endpoint
config :facelixir, FacelixirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "eXTkl+wHUO2NosuDqQQ/NCdMpkWPKF/ci0ZXoUpHkP/7a9euUZ2+oKOSW0vH9nhX",
  render_errors: [view: FacelixirWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Facelixir.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
