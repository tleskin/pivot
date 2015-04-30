require 'rails_helper'

RSpec.describe 'unauthenticated user' do
  it 'can see a list of all categories' do
    create(:category)
    visit categories_path
    expect(page).to have_content("Grass")
  end
end
