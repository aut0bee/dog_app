defmodule Dogs.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Dogs.Repo
      # Starts a worker by calling: Dogs.Worker.start_link(arg)
      # {Dogs.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Dogs.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
