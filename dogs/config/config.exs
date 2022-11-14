import Config

config :dogs, Dogs.Repo,
  database: "dogs_repo",
  username: "postgres",
  password: "pass",
  hostname: "localhost"

config :dogs,
  ecto_repos: [Dogs.Repo]

config :waffle,
  storage: Waffle.Storage.S3,
  bucket: {:system, "AWS_BUCKET_NAME"},
  asset_host: {:system, "ASSET_HOST"}

config :ex_aws,
  json_codec: Jason,
  access_key_id: {:system, "AWS_ACCESS_KEY_ID"},
  secret_access_key: {:system, "AWS_SECRET_ACCESS_KEY"},
  s3: [
    scheme: "https://",
    host: "AWS_BUCKET_NAME.s3.amazonaws.com",
    region: "AWS_REGION"
  ]

import_config "#{Mix.env()}.exs"
