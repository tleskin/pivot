require 'rails_helper'

RSpec.describe 'unauthenticated user' do
  let(:category){
    Category.last
  }
  it 'can see a list of all items in a category' do
    visit category_path(category)
    expect(page).to have_content("Metapod")
  end
end
