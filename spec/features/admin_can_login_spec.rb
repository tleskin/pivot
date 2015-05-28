require 'rails_helper'

RSpec.describe 'admin user' do
  context 'with an active account' do
    xit 'can login' do
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
      expect(page).to have_content("Manage Region")
    end
  end
  context 'with invalid params' do
    xit 'displays invalid login' do
      visit login_path
      within(:css, 'div.all-modals') do
        click_button "Login"
        expect(page).to have_content("Invalid login")
      end
    end
  end
end
