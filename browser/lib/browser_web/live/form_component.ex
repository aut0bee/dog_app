defmodule BrowserWeb.Live.FormComponent do
  use BrowserWeb, :live_component
  alias Dogs.Dog

  def mount(_params, _session, socket) do
    changeset = Dogs.change_post(%Dog{})

    {:ok,
     socket
     |> assign(changeset: changeset)
     |> assign(:changeset, changeset)
     |> allow_upload(:image, accept: ~w(.jpg .jpeg .png), max_entries: 1)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.form let={f} for={@changeset} action={@action}>
    <%= if @changeset.action do %>
    <div class="alert alert-danger">
      <p>Oops, something went wrong! Please check the errors below.</p>
    </div>
    <% end %>

    <%= label f, :breed %>
    <%= text_input f, :breed %>
    <%= error_tag f, :breed %>

    <%= label f, :name %>
    <%= text_input f, :name %>
    <%= error_tag f, :name %>

    <%= label f, :age %>
    <%= text_input f, :age %>
    <%= error_tag f, :age %>

    <%= label f, :avatar %>
    <%= live_file_input f, @uploads.avatar %>
    <%= error_tag f, :avatar %>

    <div>
    <%= submit "Save" %>
    </div>
    </.form>

    """
  end
end
