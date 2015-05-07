require 'rails_helper'

RSpec.describe Cart, type: :model do
  context 'with contents' do
    let(:cart){
      Cart.new({"1" => 2,
                "3" => 4})
    }

    it 'can add an item' do
      cart.add_item("3")
      expect(cart.contents).to eq({"1" => 2, "3" => 5})
    end

    it 'can subtract an item' do
      cart.subtract_item("3")
      expect(cart.contents).to eq({"1" => 2, "3" => 3})
    end

    it 'can take quantity' do
      expect(cart.quantity("1")).to eq(2)
      expect(cart.quantity("3")).to eq(4)
    end

    it 'can remove an item' do
      cart.remove_item("3")
      expect(cart.contents).to eq({"1" => 2})
    end
  end
end
