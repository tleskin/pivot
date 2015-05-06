require 'rails_helper'

RSpec.describe 'user' do
  context 'for a given item' do
    let(:item){
      Item.create(title: "Gyrados",
                  description: "Water Dragon",
                  price: 3000)
    }
    it 'can write a review' do
      visit item_path(item)
      expect(page).to have_content("Gyrados")
    end
  end
end
