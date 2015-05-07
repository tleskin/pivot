require 'rails_helper'

RSpec.describe 'user' do
  context 'with an active account' do

  it 'can be edited' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit edit_user_path(user)
      fill_in "First name", with: "Steve"
      fill_in "Last name", with: "Jones"
      fill_in "Email", with: "s@jones.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_button "Update User"
      expect(user.first_name).to eq("Steve")
    end
  end
end
