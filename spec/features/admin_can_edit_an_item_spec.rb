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
      fill_in "Title", with: "Charmeleon"
      click_button "Update Item"
      expect(page).to have_content("Charmeleon")
    end
  end
end
