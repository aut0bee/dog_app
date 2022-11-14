defmodule Dogs.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Dogs.Dogs` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        breed: "some breed",
        name: "some name",
        age: 1
      })
      |> Dogs.create_post()

    post
  end
end
