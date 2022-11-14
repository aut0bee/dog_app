defmodule BrowserWeb.PageController do
  use BrowserWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
