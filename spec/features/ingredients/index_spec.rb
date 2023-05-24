require "rails_helper"

RSpec.describe "/ingredients, ingredients index page", type: :feature do
let!(:beef) { Ingredient.create!(name: "Ground Beef", cost: 2) }
let!(:salt) { Ingredient.create!(name: "Salt", cost: 4) }
  
  describe "as a visitor to /ingredients page" do
    it "should see a list of all ingredients and their attributes" do
      visit "/ingredients"
      # save_and_open_page
      expect(page).to have_content("All Ingredients")
      expect(page).to have_content("Name: #{beef.name}")
      expect(page).to have_content("Cost: #{beef.cost}")
      expect(page).to have_content("Name: #{salt.name}")
      expect(page).to have_content("Cost: #{salt.cost}")
    end
  end
end