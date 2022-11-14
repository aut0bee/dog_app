defmodule BrowserWeb.PostController do
  use BrowserWeb, :controller

  # alias Dogs.Dogs
  alias Dogs.Dog

  def index(conn, _params) do
    posts = Dogs.list_posts()
    render(conn, "index.html", posts: posts)
  end

  def new(conn, _params) do
    changeset = Dogs.change_post(%Dog{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"dog" => post_params}) do
    case Dogs.create_post(post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post created successfully.")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    post = Dogs.get_post!(id)
    render(conn, "show.html", post: post)
  end

  def edit(conn, %{"id" => id}) do
    post = Dogs.get_post!(id)
    changeset = Dogs.change_post(post)
    render(conn, "edit.html", post: post, changeset: changeset)
  end

  def update(conn, %{"id" => id, "dog" => post_params}) do
    post = Dogs.get_post!(id)

    case Dogs.update_post(post, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post updated successfully.")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", post: post, changeset: changeset)
    end
  end

  def update_avatar(conn, %{"id" => id, "dog" => post_params}) do
    post = Dogs.get_post!(id)

    case Dogs.update_user_avatar(post, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Avatar updated successfully.")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, changeset} ->
        render(conn, "edit.html", avatar_changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Dogs.get_post!(id)
    {:ok, _post} = Dogs.delete_post(post)

    conn
    |> put_flash(:info, "Post deleted successfully.")
    |> redirect(to: Routes.post_path(conn, :index))
  end
end
