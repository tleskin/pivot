require 'rails_helper'

RSpec.describe 'user' do
  context 'with a cart' do
    let(:cart){
      Cart.new({"1" => 1,
                "3" => 2})
    }
    it 'can create an order' do
      user = create(:user)
      expect(cart.contents).to_not eq(nil)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      allow_any_instance_of(ApplicationController).to receive(:load_cart).and_return(cart)
      visit root_path
      click_link "My Cart"
      click_button "Submit Order"
      expect(Order.all.size).to eq(1)
    end
  end
end
