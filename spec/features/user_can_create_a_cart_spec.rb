require 'rails_helper'

RSpec.describe 'user' do
  context 'with valid params' do
    it 'can create a cart' do
      create(:item)
      visit root_path
      click_button "Add to Cart"
      expect(page).to have_content("Pikachu")
    end
  end
end
