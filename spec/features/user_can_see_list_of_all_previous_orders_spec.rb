require 'rails_helper'

RSpec.describe 'user' do
  context 'with a history of orders' do
    let(:user){
         User.create(first_name: "Seve",
                        last_name: "Rones",
                        username: "srones",
                        email: "s@rones.com",
                        password: "password",
                        password_confirmation: "password")
    }
    it 'can see a list of previous orders' do
      visit login_path
      Order.create(status: "completed",
                   user_id: user.id
                   )
      user.save
      fill_in "session[username]", with: "srones"
      fill_in "session[password]", with: "password"
      click_link_or_button "Login"
      click_link_or_button "My Orders"
      expect(page).to have_content("completed")
    end
  end
end
