defmodule ReecipeBackend.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :title, :string, null: false
      add :description, :string, null: true
      add :tag, {:array, :string}, null: true
      add :yields, {:array, :string}, null: true
      add :ingredients, {:array, :map}, null: false
      add :instructions, {:array, :string}, null: true

      timestamps()
    end

  end
end
