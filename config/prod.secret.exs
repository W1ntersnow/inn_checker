use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :euler, EulerWeb.Endpoint,
  secret_key_base: "9LoDbqIjbYAwGpwHSmYDku+P3sRgjVxSddf5iXx0wv5IJagEQx7k8+IjWngioI8z"

# Configure your database
config :euler, Euler.Repo,
  username: "postgres",
  password: "secret876key",
  database: "euler_prod",
  pool_size: 15
