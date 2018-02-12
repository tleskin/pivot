require 'rails_helper'

RSpec.describe Portfolio, type: :model do
  context 'a portfolio' do
    let(:port){
         Portfolio.new(Hash.new())
      }

    it 'can add an item' do
      port.add_item(1)
      expect(port.contents).to eq({"1" => 1})
    end

    it 'can subtract an item' do
      port.add_item(1)
      port.add_item(1)
      expect(port.contents).to eq({"1" => 2})
      port.subtract_item(1)
      expect(port.contents).to eq({"1" => 1})
    end

    it 'can return the quantity of an item' do
      port.add_item(1)
      port.add_item(1)
      expect(port.quantity("1")).to eq(2)
    end

    it 'can remove an item' do
      port.add_item(1)
      expect(port.contents).to eq({"1" => 1})
      port.remove_item("1")
      expect(port.contents).to eq({})
    end

  end
end
