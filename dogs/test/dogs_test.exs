defmodule DogsTest do
  use ExUnit.Case

  alias Dogs.Dog

  import Dogs.PostsFixtures

  @invalid_attrs %{breed: nil, name: nil}

  setup do
    # Explicitly get a connection before each test
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Dogs.Repo)
  end

  test "the world should be greeted" do
    assert Dogs.hello() == :world
  end

  test "list_posts/0 should return all posts" do
    post = post_fixture()
    assert Dogs.list_posts() == [post]
  end

  test "get_post!/1 should return a specific post with a given id" do
    post = post_fixture()
    assert Dogs.get_post!(post.id) == post
  end

  test "get_post!/1 should return an error when given a non existent id" do
    invalid_id = 666
    assert_raise Ecto.NoResultsError, fn -> Dogs.get_post!(invalid_id) end
  end

  test "create_post/1 with valid data should create a post" do
    valid_attrs = %{breed: "Blue Heeler", name: "Pepper"}

    assert {:ok, %Dog{} = post} = Dogs.create_post(valid_attrs)
    assert post.breed == "Blue Heeler"
    assert post.name == "Pepper"
  end

  test "create_post/1 with invalid data should return an error changeset" do
    assert {:error, %Ecto.Changeset{}} = Dogs.create_post(@invalid_attrs)
  end

  test "update_post/2 with valid data should update a chosen post" do
    post = post_fixture()
    update_attrs = %{breed: "updated breed", name: "updated name"}

    assert {:ok, %Dog{} = post} = Dogs.update_post(post, update_attrs)
    assert post.breed == "updated breed"
    assert post.name == "updated name"
  end

  test "update_post/2 with invalid data should return an error changeset" do
    post = post_fixture()
    assert {:error, %Ecto.Changeset{}} = Dogs.update_post(post, @invalid_attrs)
    assert post == Dogs.get_post!(post.id)
  end

  test "delete_post/1 should delete a chosen post" do
    post = post_fixture()
    assert {:ok, %Dog{}} = Dogs.delete_post(post)
    assert_raise Ecto.NoResultsError, fn -> Dogs.get_post!(post.id) end
  end
end
