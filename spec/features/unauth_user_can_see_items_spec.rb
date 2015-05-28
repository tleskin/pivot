require 'rails_helper'

RSpec.describe 'unauthenticated user can see a list of all items' do

  xit 'shows items' do
    create(:item)
    visit root_path
    expect(page).to have_content("Pikachu")
  end
end
