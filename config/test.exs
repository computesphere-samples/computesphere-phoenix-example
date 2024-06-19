import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :computesphere_phoenix_example, ComputespherePhoenixExampleWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Cuu7GxqVI8jJ/dm9MTCBcrsWaoHjKILVBYowf7BsdO8BruCHrCXQg0MzsQVaKn6j",
  server: false

# In test we don't send emails
config :computesphere_phoenix_example, ComputespherePhoenixExample.Mailer,
  adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true
