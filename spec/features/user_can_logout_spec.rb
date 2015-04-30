require 'rails_helper'

RSpec.describe 'user' do
  it 'can logout' do
    # User.create(first_name:"s",
    #             last_name: "jones",
    #             username:"sjones",
    #             email: "s@jones.com",
    #             password: "password",
    #             password_confirmation: "password")
    #             
    create(:user)

    visit login_path
    fill_in "session[username]", with: "sjones"
    fill_in "session[password]", with: "password"
    click_button "Login"
    click_button "Logout"
    expect(page).to have_content("Successfully logged out")
  end
end
