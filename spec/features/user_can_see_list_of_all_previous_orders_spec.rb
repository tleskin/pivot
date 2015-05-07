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
      Order.create(status: "completed",
                   user_id: user.id)
      Order.create(status: "paid",
                   user_id: user.id)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit orders_path
      expect(page).to have_content("completed")
      expect(page).to have_content("paid")
    end
  end
end
