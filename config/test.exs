use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ten_thousand_dollar_homepage, TenThousandDollarHomepageWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :ten_thousand_dollar_homepage, TenThousandDollarHomepage.Repo,
  username: "postgres",
  password: "postgres",
  database: "ten_thousand_dollar_homepage_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
