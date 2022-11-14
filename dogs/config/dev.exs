import Config

config :dogs, Dogs.Repo,
  database: "dogs_repo",
  username: "postgres",
  password: "pass",
  hostname: "localhost"

config :dogs,
  uploads_directory: "/Users/Autobee/dog_app_project/dogs/lib/uploads"
