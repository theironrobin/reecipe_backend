defmodule ReecipeBackend.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :title, :string, null: false
      add :description, :string
      add :tag, {:array, :string}
      add :yields, {:array, :string}
      add :ingredients, {:array, :map}, null: false
      add :instructions, {:array, :string}

      timestamps()
    end

  end
end
