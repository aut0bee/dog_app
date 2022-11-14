defmodule Dogs do
  @moduledoc """
  Documentation for `Dogs`.
  """

  import Ecto.Query, warn: false

  alias Dogs.Repo
  alias Dogs.Dog

  @doc """
  Hello world.

  ## Examples

      iex> Dogs.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """
  Returns the list of posts.

  ## Examples

      iex> list_posts()
      [%Posts.Dog{}, ...]``

  """
  def list_posts do
    Repo.all(from(p in Dog, order_by: [desc: p.id]))
  end

  @doc """
  Gets a single post.

  Raises `Ecto.NoResultsError` if the Post does not exist.

  ## Examples

      iex> get_post!(123)
      %Posts.Dog{}

      iex> get_post!(456)
      ** (Ecto.NoResultsError)

  """
  def get_post!(id), do: Repo.get!(Dog, id)

  @doc """
  Creates a post.

  ## Examples

      iex> create_post(%{field: value})
      {:ok, %Dog{}}

      iex> create_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_post(attrs \\ %{}) do
    %Dog{}
    |> Dog.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a post.

  ## Examples

      iex> update_post(dog, %{field: new_value})
      {:ok, %Posts.Dog{}}

      iex> update_post(dog, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_post(%Dog{} = dog, attrs) do
    dog
    |> Dog.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a post.

  ## Examples

      iex> delete_post(post)
      {:ok, %Posts.Dog{}}

      iex> delete_post(post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_post(%Dog{} = post) do
    Repo.delete(post)
  end

  # @doc """
  # Returns an `%Ecto.Changeset{}` for tracking post changes.

  # ## Examples

  #     iex> change_post(post)
  #     %Ecto.Changeset{data: %Post{}}

  # """
  def change_post(%Dog{} = post, attrs \\ %{}) do
    Dog.changeset(post, attrs)
  end
end

# Dogs.create_post(%{breed: "Pug", name: "Cheetos", age: 4})
