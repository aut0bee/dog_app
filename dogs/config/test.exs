import Config

config :dogs, Dogs.Repo,
  username: "postgres",
  password: "postgres",
  database: "dogs_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
