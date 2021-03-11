defmodule ReecipeBackendWeb.RecipeView do
  use ReecipeBackendWeb, :view
  alias ReecipeBackendWeb.RecipeView

  def render("index.json", %{recipes: recipes}) do
    %{data: render_many(recipes, RecipeView, "recipe.json")}
  end

  def render("show.json", %{recipe: recipe}) do
    %{data: render_one(recipe, RecipeView, "recipe.json")}
  end

  def render("recipe.json", %{recipe: recipe}) do
    %{id: recipe.id,
      title: recipe.title,
      description: recipe.description,
      tag: recipe.tag,
      yields: recipe.yields,
      ingredients: recipe.ingredients,
      instructions: recipe.instructions}
  end
end
