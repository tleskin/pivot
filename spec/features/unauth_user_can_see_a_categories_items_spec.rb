require 'rails_helper'

RSpec.describe 'unauthenticated user' do
  xit 'can see a list of all businesses in a category' do
    business = create(:business_with_categories)
    visit category_path(region: business.region_id, id:business.categories.last)
    expect(page).to have_content("Bizniz")
  end
end
