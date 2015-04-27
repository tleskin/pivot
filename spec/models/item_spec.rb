require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item){
    Item.new(title: "Food",
             description: "Good",
             price: 900)
  }

  context 'with valid params' do
    it 'is valid' do
      expect(item).to be_valid
    end
  end
end
