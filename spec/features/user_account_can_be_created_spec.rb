# require 'rails_helper'
#
# RSpec.describe 'user' do
#   it 'can be created' do
#     visit new_users_path
#     save_and_open_page
#     within('#wrapper') do
#       fill_in "user[first_name]", with: "Steve"
#       fill_in "user[last_name]", with: "Jones"
#       fill_in "user[username]", with: "pjones"
#       fill_in "user[email]", with: "s@jones.com"
#       fill_in "user[password]", with: "password"
#       fill_in "user[password_confirmation]", with: "password"
#       click_button "Create Account"
#     end
#     expect(page).to have_content("Steve")
#   end
# end
