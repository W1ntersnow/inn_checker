use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :euler, EulerWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :euler, Euler.Repo,
  username: "postgres",
  password: "secret876key",
  database: "euler_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
