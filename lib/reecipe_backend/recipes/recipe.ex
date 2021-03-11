defmodule ReecipeBackend.Recipes.Recipe do
  use Ecto.Schema
  import Ecto.Changeset

  schema "recipes" do
    field :description, :string
    field :ingredients, {:array, :map}
    field :instructions, {:array, :string}
    field :tag, {:array, :string}
    field :title, :string
    field :yields, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:title, :description, :tag, :yields, :ingredients, :instructions])
    |> validate_required([:title, :description, :tag, :yields, :ingredients, :instructions])
  end
end
