require 'rails_helper'

RSpec.describe 'user' do
  it 'can logout' do
    create(:user)

    visit root_path
    click_link "Login"
    fill_in "session[email]", with: "user@example.com"
    fill_in "session[password]", with: "password"
    click_button "Login"
    click_link "Logout"
    expect(page).to have_content("Successfully logged out")
  end
end
