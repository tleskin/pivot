require 'rails_helper'

RSpec.describe 'user' do
  context 'for an item with reviews' do
    let(:item){
      Item.create(id: 1,
                  title:"Venusaur",
                  description: "Grass Pokemon",
                  price: 1200)
    }
    let(:review){
      Review.create(title: "title", review: "review", score: 3, item_id: 1)
    }
    let(:user){
      User.create(id:1,
               first_name: "Steve",
               last_name: "Jones",
               email: "steve@jones.com",
               username: "sjones",
               password: "password",
               password_confirmation: "password")

    }
    it 'can see an items reviews'do
      user.reviews << review
      item.reviews << review
      visit item_path(item)
      expect(page).to have_content("review")
    end
  end
end
