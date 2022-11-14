defmodule Dogs.Dog do
  use Ecto.Schema
  alias Ecto.Changeset
  use Waffle.Ecto.Schema

  schema "dogs" do
    field(:breed, :string)
    field(:name, :string)
    field(:age, :integer)
    field(:avatar, :string)
  end

  def changeset(dog, params \\ %{}) do
    dog
    |> Changeset.cast(params, [:breed, :name, :age])
    |> cast_attachments(params, [:avatar])
    |> Changeset.validate_required([:breed])
  end
end
