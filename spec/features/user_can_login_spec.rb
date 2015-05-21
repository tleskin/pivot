require 'rails_helper'

RSpec.describe 'user' do
  context 'with an active account' do
    it 'can login' do
      create(:user)

      visit root_path
      click_link "Login"
      fill_in "session[email]", with: "user@example.com"
      fill_in "session[password]", with: "password"
      click_button "Login"
      expect(page).to have_content("Steve")
    end
  end
end
