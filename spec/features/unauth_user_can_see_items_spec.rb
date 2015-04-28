require 'rails_helper'

RSpec.describe 'unauthenticated user can see a list of all items' do

  it 'shows items' do
    visit root_path
    expect(page).to have_content("Pikachu")
  end
end
