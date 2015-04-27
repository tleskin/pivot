require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order){
    Order.new(status: "ordered", user_id: 1)
  }
  context 'with valid params' do
    it 'is valid' do
      expect(order).to be_valid
    end

  end

  context 'with invalid params' do
    it 'is invalid' do
      order.status = ""
      expect(order).to_not be_valid
      order.status = "done"
      expect(order).to_not be_valid
    end
  end

end
