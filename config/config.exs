# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

# Configures the endpoint
config :a_star, AStarWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8mCFYMwXvt4jdXwfswTZScF3sKcbKLQZUrVTIU1gaNMocSCnRfOp6zyY/edi8lyy",
  render_errors: [view: AStarWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: AStar.PubSub,
  live_view: [signing_salt: "pGC1f5JU"]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.12.18",
  default: [
    args: ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
