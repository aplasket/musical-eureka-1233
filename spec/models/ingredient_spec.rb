require "rails_helper"

RSpec.describe Ingredient, type: :model do

   describe "validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :cost }
   end

   describe "relationships" do
      it { should have_many :recipe_ingredients }
      it { should have_many(:recipes).through(:recipe_ingredients) }
   end

   describe "class methods" do
      let!(:beef) { Ingredient.create!(name: "Ground Beef", cost: 2) }
      let!(:salt) { Ingredient.create!(name: "Salt", cost: 4) }
      let!(:apple) { Ingredient.create!(name: "Apple", cost: 1) }
      
      it ".alpha_name" do
         expect(Ingredient.alpha_name).to eq([apple, beef, salt])
      end
   end
end