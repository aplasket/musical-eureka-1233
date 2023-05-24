require "rails_helper"

RSpec.describe "/recipes/:id, recipe show page", type: :feature do
  describe "as a visitor to show page" do
    
      let!(:spaghetti) { Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian") }
      let!(:mac_cheese) {Recipe.create!(name: "Mac and Cheese", complexity: 1, genre: "American")}

      let!(:beef) { Ingredient.create!(name: "Ground Beef", cost: 2) }
      let!(:salt) { Ingredient.create!(name: "Salt", cost: 1) }
      let!(:pasta) { Ingredient.create!(name: "Penne Pasta", cost: 4) }
      let!(:tomato) { Ingredient.create!(name: "Tomato", cost: 2) }

      let!(:recipe_ing1) { RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: beef.id) }
      let!(:recipe_ing2) { RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: pasta.id) }
      let!(:recipe_ing3) { RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: tomato.id) }

    it "should see the specific recipe and it's attributes and ingredients needed" do
      visit "/recipes/#{spaghetti.id}"
      
      expect(page).to have_content(spaghetti.name)
      expect(page).to have_content("Complexity: #{spaghetti.complexity}")
      expect(page).to have_content("Genre: #{spaghetti.genre}")

      expect(page).to have_content("Ingredients:")
      expect(page).to have_content(beef.name)
      expect(page).to have_content(pasta.name)
      expect(page).to have_content(tomato.name)

      expect(page).to_not have_content(mac_cheese.name)
      expect(page).to_not have_content(salt.name)
    end

    it "shows the total cost of all ingredients for the recipe" do
      visit "/recipes/#{spaghetti.id}"
        # save_and_open_page
      expect(page).to have_content("Total Cost: 8")
    end
  end
end