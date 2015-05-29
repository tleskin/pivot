require 'rails_helper'

RSpec.describe 'user' do
  context 'that has been created' do
    # let(:user){
    #   User.create(id: 1,
    #               first_name: "Bill",
    #               last_name: "Jones",
    #               username: "bjones",
    #               email: "bill@jones.com",
    #               password: "password",
    #               password_confirmation: "password")
    # }
    xit 'can be edited' do
      user = create(:user)
      visit edit_user_path(id: user.id)
      within('.edit_user') do
        save_and_open_page
        fill_in "user[first_name]", with: "steve"
        click_button "Update User"
      end
      expect(page).to have_content("steve")
    end
  end
end
