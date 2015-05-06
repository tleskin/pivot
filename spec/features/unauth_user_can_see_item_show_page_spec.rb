require 'rails_helper'

RSpec.describe 'unauthenticated user can see a details of an individual item' do
  let(:item){
    Item.create(title: "Zapdos",
                description: "Legendary Electric pokemon",
                price: 2900
                )
  }
  it 'shows items' do
    expect(item).to be_valid
    visit item_path(item)
    # save_and_open_page
    # expect(page).to have_content("Zapdos")
  end
end
