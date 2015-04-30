require 'rails_helper'

RSpec.describe 'unauthenticated user' do
  it 'can see a list of all items in a category' do
    category = create(:category)
    item = create(:item)
    #need to associate this item with this category
    visit category_path(category)
    expect(page).to have_content("Metapod")
  end
end
