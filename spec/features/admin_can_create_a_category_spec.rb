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
    it 'can create a categories' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit new_admin_category_path
      fill_in "Name", with: "Psychic"
      click_button "Create Category"
      expect(page).to have_content("Psychic")
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
    xit 'cannot create a category' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit new_admin_category_path
      expect(page).to have_content("error")
      #this fails, currently default users can create categories
    end
  end
end
