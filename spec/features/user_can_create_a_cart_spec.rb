require 'rails_helper'

RSpec.describe 'user' do
  context 'with valid params' do
    let(:item){
      Item.first
    }
    it 'can create a cart' do
      visit root_path
      within("#{item.title}").click
      visit cart_show_path
      expect(page).to have_content(item.title)
    end
  end
end
