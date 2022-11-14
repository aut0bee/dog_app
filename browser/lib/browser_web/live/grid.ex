defmodule BrowserWeb.Live.Grid do
  use BrowserWeb, :live_view

  def mount(_params, _session, socket) do
    grid = Dogs.list_posts()
    socket = socket |> assign(%{grid: grid})
    {:ok, socket}
  end

  # def mount(_params, _session, socket) do
  #   changeset = Dogs.change_post(%Dog{})

  #   {
  #     :ok,
  #     socket
  #     |> assign(changeset: changeset)
  #     |> allow_upload(:avatar,
  #       accept: ~w(.jpg .jpeg .png),
  #       max_entries: 2
  #     )
  #   }
  # end

  # def mount(_params, _session, socket) do
  #   {:ok, socket}
  # end

  def render(assigns) do
    ~H"""
    <p>
    Hello!
    </p>
    """
  end
end
