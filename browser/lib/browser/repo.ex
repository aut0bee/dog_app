defmodule Browser.Repo do
  use Ecto.Repo,
    otp_app: :browser,
    adapter: Ecto.Adapters.Postgres
end
