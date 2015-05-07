require 'rails_helper'

RSpec.describe 'admin user' do
  context 'with an active account' do
    it 'can login' do
      User.create(first_name: "Steve",
                  last_name: "Jones",
                  username: "xjones",
                  email: "x@jones.com",
                  password: "password",
                  password_confirmation: "password",
                  role: 1)
      visit login_path
      fill_in "session[username]", with: "xjones"
      fill_in "session[password]", with: "password"
      click_button "Login"
      expect(page).to have_content("Admin Dashboard Welcome Steve")
    end
  end
  context 'with invalid params' do
    it 'displays invalid login' do
      visit login_path
      click_button "Login"
      expect(page).to have_content("Invalid login")
    end
  end
end
