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
    it 'can see a list of businesses' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      create(:business)
      visit regional_admin_region_businesses_path
      expect(page).to have_content("Bizniz")
    end
  end
end
