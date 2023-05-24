require "rails_helper"

RSpec.describe Recipe, type: :model do
   
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe "relationships" do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe "instance methods" do
    let!(:spaghetti) { Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian") }
    let!(:mac_cheese) {Recipe.create!(name: "Mac and Cheese", complexity: 1, genre: "American")}

    let!(:beef) { Ingredient.create!(name: "Ground Beef", cost: 2) }
    let!(:salt) { Ingredient.create!(name: "Salt", cost: 1) }
    let!(:pasta) { Ingredient.create!(name: "Penne Pasta", cost: 4) }
    let!(:tomato) { Ingredient.create!(name: "Tomato", cost: 2) }

    let!(:recipe_ing1) { RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: beef.id) }
    let!(:recipe_ing2) { RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: pasta.id) }
    let!(:recipe_ing3) { RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: tomato.id) }


    it "#total_cost" do
      expect(spaghetti.total_cost).to eq(8)
      expect(mac_cheese.total_cost).to eq(0)
    end
  end
end