defmodule BrowserWeb.Grid.Modal do
  use BrowserWeb, :live_component

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <p>
    Hello again!
    </p>
    """
  end
end
