require 'rails_helper'

RSpec.describe 'user' do
  it 'can be created' do
    visit new_user_path
    fill_in "First name", with: "Steve"
    fill_in "Last name", with: "Jones"
    fill_in "Username", with: "pjones"
    fill_in "Email", with: "s@jones.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create User"
    expect(page).to have_content("Steve")
  end
end
