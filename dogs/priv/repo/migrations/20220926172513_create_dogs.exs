defmodule Dogs.Repo.Migrations.CreateDogs do
  use Ecto.Migration

  def change do
    create table(:dogs) do
      add :breed, :string
      add :name, :string
      add :age, :integer
      add :avatar, :string
    end
  end
end
