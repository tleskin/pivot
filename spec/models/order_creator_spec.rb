require 'rails_helper'

RSpec.describe OrderCreator, type: :model do
  context 'with a cart containing items and quantities' do
    let(:cart){
      Cart.new([[1,2], [2, 3]])
    }
    let(:user){
      User.new(first_name: "Bill",
                   last_name: "Jones",
                   username: "bjones",
                   email: "bill@jones.com",
                   password: "password",
                   password_confirmation: "password")
        }
    it 'can convert the cart to an order' do
      Item.create(id:1,
                  title:"Cranman",
                  description:"Crantacular",
                  price: 2400)
      Item.create(id:2,
                  title:"Panman",
                  description:"Pantacular",
                  price: 2400)
      order = OrderCreator.generate(cart, user)
      expect(Purchase.last.quantity).to eq(3)
      expect(Purchase.first.item_id).to eq(1)
      expect(Purchase.count).to eq(2)
    end
  end
end
