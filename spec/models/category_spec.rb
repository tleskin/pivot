require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category){
    Category.new(name:"Italian")
  }
  context 'with valid params' do
    it 'is valid' do
      expect(category).to be_valid
    end

    it 'has one or many businesses' do
      category.save
      expect(category.businesses).to eq([])
    end
  end

  context 'with invalid params' do
    it 'is invalid without a name' do
      category.name = ""
      expect(category).to_not be_valid
    end
  end
end
