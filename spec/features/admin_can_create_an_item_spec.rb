require 'rails_helper'

RSpec.describe 'admin' do
  context 'with valid credentials' do
    #need to replace let admin with factory girl create admin
    let(:admin){
      User.create(first_name: "Admin",
                  last_name: "astrator",
                  username: "admin",
                  email: "admin@admin.com",
                  password: "password",
                  password_confirmation: "password",
                  role: 1)
    }
    it 'can create a new item' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit new_admin_item_path
      fill_in "Title", with: "Butterfree"
      fill_in "Description", with: "Bug pokemon"
      fill_in "Price", with: 500
      click_link_or_button "Create Item"
      expect(page).to have_content("Butterfree")
    end

    it 'can assign categories to an item' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      create(:category)
      visit new_admin_item_path
      fill_in "Title", with: "Butterfree"
      fill_in "Description", with: "Bug pokemon"
      fill_in "Price", with: 500
      check "Grass"
      click_link_or_button "Create Item"
      visit categories_path
      click_link_or_button "Grass"
      expect(page).to have_content("Butterfree")
      visit categories_path
    end
  end
  context 'with invalid credentials' do
    let(:user){
      User.create(first_name: "default",
                  last_name: "default",
                  username: "default",
                  email: "default@default.com",
                  password: "password",
                  password_confirmation: "password"
                  )
    }
    it 'cannot create item'do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit new_admin_item_path
    expect(page).to have_content("The page you were looking for doesn't exist")
    #this fails because user can create item currently
    end
  end
end
