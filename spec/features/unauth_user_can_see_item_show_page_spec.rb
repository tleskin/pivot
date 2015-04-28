require 'rails_helper'

RSpec.describe 'unauthenticated user can see a details of an individual item' do
  let(:item){
    Item.first
  }
  it 'shows items' do
    visit item_path(item)
    expect(page).to have_content("Pikachu")
  end
end
