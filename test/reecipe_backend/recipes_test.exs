defmodule ReecipeBackend.RecipesTest do
  use ReecipeBackend.DataCase

  alias ReecipeBackend.Recipes

  describe "recipes" do
    alias ReecipeBackend.Recipes.Recipe

    @valid_attrs %{description: "some description", ingredients: [], instructions: [], tag: [], title: "some title", yields: []}
    @update_attrs %{description: "some updated description", ingredients: [], instructions: [], tag: [], title: "some updated title", yields: []}
    @invalid_attrs %{description: nil, ingredients: nil, instructions: nil, tag: nil, title: nil, yields: nil}

    def recipe_fixture(attrs \\ %{}) do
      {:ok, recipe} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Recipes.create_recipe()

      recipe
    end

    test "list_recipes/0 returns all recipes" do
      recipe = recipe_fixture()
      assert Recipes.list_recipes() == [recipe]
    end

    test "get_recipe!/1 returns the recipe with given id" do
      recipe = recipe_fixture()
      assert Recipes.get_recipe!(recipe.id) == recipe
    end

    test "create_recipe/1 with valid data creates a recipe" do
      assert {:ok, %Recipe{} = recipe} = Recipes.create_recipe(@valid_attrs)
      assert recipe.description == "some description"
      assert recipe.ingredients == []
      assert recipe.instructions == []
      assert recipe.tag == []
      assert recipe.title == "some title"
      assert recipe.yields == []
    end

    test "create_recipe/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Recipes.create_recipe(@invalid_attrs)
    end

    test "update_recipe/2 with valid data updates the recipe" do
      recipe = recipe_fixture()
      assert {:ok, %Recipe{} = recipe} = Recipes.update_recipe(recipe, @update_attrs)
      assert recipe.description == "some updated description"
      assert recipe.ingredients == []
      assert recipe.instructions == []
      assert recipe.tag == []
      assert recipe.title == "some updated title"
      assert recipe.yields == []
    end

    test "update_recipe/2 with invalid data returns error changeset" do
      recipe = recipe_fixture()
      assert {:error, %Ecto.Changeset{}} = Recipes.update_recipe(recipe, @invalid_attrs)
      assert recipe == Recipes.get_recipe!(recipe.id)
    end

    test "delete_recipe/1 deletes the recipe" do
      recipe = recipe_fixture()
      assert {:ok, %Recipe{}} = Recipes.delete_recipe(recipe)
      assert_raise Ecto.NoResultsError, fn -> Recipes.get_recipe!(recipe.id) end
    end

    test "change_recipe/1 returns a recipe changeset" do
      recipe = recipe_fixture()
      assert %Ecto.Changeset{} = Recipes.change_recipe(recipe)
    end
  end
end
