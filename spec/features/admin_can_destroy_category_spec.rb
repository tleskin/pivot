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
    let(:category){
      Category.create(name: "Fighting")
    }
    it 'can destroy an item' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      category.save
      visit admin_categories_path
      expect(page).to have_content("Fighting")
      visit admin_category_path(category)
      click_link_or_button "Destroy"
      expect(page).to_not have_content("Fighting")
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
    let(:category){
      Category.create(name: "Fighting")
    }
    it 'cannot destroy category' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit admin_categories_path
      expect(page).to have_content("The page you were looking for doesn't exist")
      #failing due to admin errors
    end
  end
end
