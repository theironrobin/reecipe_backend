defmodule ReecipeBackend.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :title, :string
      add :description, :string
      add :tag, {:array, :string}
      add :yields, {:array, :string}
      add :ingredients, {:array, :map}
      add :instructions, {:array, :string}

      timestamps()
    end

  end
end
