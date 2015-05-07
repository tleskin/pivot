require 'rails_helper'

RSpec.describe 'admin' do
  context 'with an order' do
    let(:user){
      User.create(first_name: "Steve",
                  last_name: "Jones",
                  username: "sjones",
                  email: "steve@jones.com",
                  password: "password",
                  password_confirmation: "password")
      }

    let(:order){
      Order.create(status: "ordered",
                 user_id: user.id)
      }
    let(:admin){
      User.create(first_name: "Admin",
                last_name: "astrator",
                username: "admin",
                email: "admin@admin.com",
                password: "password",
                password_confirmation: "password",
                role: 1)
    }

    it 'can change the status of an order' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_order_path(order)
      select("completed", from: "order[status]")
      click_button "Update Status"
      expect(page).to have_content("Total Completed Orders: 1")
    end
  end
end
