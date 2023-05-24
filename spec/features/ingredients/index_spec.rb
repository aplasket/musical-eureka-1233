require "rails_helper"

RSpec.describe "/ingredients, ingredients index page", type: :feature do
let!(:beef) { Ingredient.create!(name: "Ground Beef", cost: 2) }
let!(:salt) { Ingredient.create!(name: "Salt", cost: 4) }
let!(:apple) { Ingredient.create!(name: "Apple", cost: 1) }
  
  describe "as a visitor to /ingredients page" do
    it "should see a list of all ingredients and their attributes" do
      visit "/ingredients"
      # save_and_open_page
      expect(page).to have_content("All Ingredients")
      expect(page).to have_content("Name: #{beef.name}, Cost: #{beef.cost}")
      expect(page).to have_content("Name: #{salt.name}, Cost: #{salt.cost}")
    end

    it "should see list of ingredients sorted alphabetically" do
      visit "/ingredients"
      # save_and_open_page
      expect(apple.name).to appear_before(beef.name)
      expect(beef.name).to appear_before(salt.name)
    end
  end
end