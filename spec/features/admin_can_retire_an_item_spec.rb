require 'rails_helper'

RSpec.describe 'admin' do
  context 'with valid credentials' do
    let(:admin){
      User.create(first_name: "Admin",
                    last_name: "astrator",
                    username: "admin",
                    email: "admin@admin.com",
                    password: "password",
                    password_confirmation: "password",
                    role: 1)
      }

    let(:item){
      Item.create(title: "Charizard",
                    description: "Fire Breathing bastard",
                    price: 2000)
      }
    it 'can edit an item' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit edit_admin_item_path(item)
      fill_in "Retired", with: true
      click_button "Update Item"
      visit root_path
      expect(page).to_not have_content("Charizard")
    end
  end
  context 'with invalid credentials' do
    let(:user){
      User.create(first_name: "user",
                  last_name: "user",
                  username: "user",
                  email: "user@user.com",
                  password: "password",
                  password_confirmation: "password"
                  )
                }
    let(:item){
      Item.create(title: "Charizard",
                    description: "Fire Breathing bastard",
                    price: 2000)
      }
    it 'cannot retire item' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit edit_admin_item_path(item)
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
