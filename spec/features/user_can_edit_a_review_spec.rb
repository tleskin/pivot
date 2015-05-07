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
    let(:user2){
      User.create(id:2,
               first_name: "Breve",
               last_name: "Jones",
               email: "breve@jones.com",
               username: "bjones",
               password: "password",
               password_confirmation: "password")

    }
    it 'can edit an items reviews'do
      user.reviews << review
      item.reviews << review
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit item_path(item)
      click_link 'Edit'
      fill_in 'review_title', with: "Cool"
      fill_in 'review_review', with: "Guy"
      choose 'score_3'
      click_button "Update Review"
      expect(page).to have_content("Cool")
      expect(page).to have_content("Guy")
    end

    it 'cannot edit other users reviews' do
      user.reviews << review
      item.reviews << review
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user2)
      visit item_path(item)
      expect(page).to_not have_content("Edit")
    end
  end
end
