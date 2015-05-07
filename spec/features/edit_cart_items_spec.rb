require 'rails_helper'

RSpec.describe 'user' do
  context 'logged in' do
    it 'can increase item quantity' do
      create(:user)
      visit login_path
      fill_in "session[username]", with: "sjones"
      fill_in "session[password]", with: "password"
      click_button "Login"
      create(:item)
      visit root_path
      click_button "Add to Cart"
      expect(page).to have_content("Pikachu")

      click_link_or_button "My Cart"
      #undefined method id for nil class
      click_link_or_button "+"

      expect(page).to have_content("2")
    end

    it 'can decrease item quantity' do
      create(:user)
      visit login_path
      fill_in "session[username]", with: "sjones"
      fill_in "session[password]", with: "password"
      click_button "Login"
      create(:item)
      visit root_path
      click_button "Add to Cart"
      expect(page).to have_content("Pikachu")

      click_link_or_button "My Cart"
      #undefined method id for nil class
      click_link_or_button "+"
      click_link_or_button "+"
      click_link_or_button "-"

      expect(page).to have_content("2")
    end

    it 'can remove item' do
      create(:user)
      visit login_path
      fill_in "session[username]", with: "sjones"
      fill_in "session[password]", with: "password"
      click_button "Login"
      create(:item)
      visit root_path
      click_button "Add to Cart"
      expect(page).to have_content("Pikachu")

      click_link_or_button "My Cart"
      #undefined method id for nil class
      click_link_or_button "Remove Item"


      expect(page).to_not have_content("Pikachu")
    end
  end
end
