require 'rails_helper'

RSpec.describe 'User' do
  let(:user){
    User.new(first_name: "Bill",
             last_name: "Jones",
             username: "bjones",
             email: "bill@jones.com",
             password: "password",
             password_confirmation: "password")
  }
  context 'with valid params' do
    it 'is valid' do
      expect(user).to be_valid
    end

    it 'has orders' do
      expect(user.orders).to eq([])
    end
  end

  context 'with invalid params' do
    it 'is invalid without a first_name' do
    user.first_name = ''
    expect(user).to_not be_valid
    end

    it 'is invalid without a last_name' do
    user.last_name = ''
    expect(user).to_not be_valid
    end

    it 'is invalid without a username' do
      user.username = ''
      expect(user).to_not be_valid
    end

    it 'is invalid without a email' do
      user.email = ''
      expect(user).to_not be_valid
    end

    it 'is invalid without a matching password combination' do
      user.password_confirmation = ''
      expect(user).to_not be_valid
    end

    it 'is invalid with a short or long username' do
      user.username = 'B'
      expect(user).to_not be_valid
      user.username = "123456789012345678901234567890123"
      expect(user).to_not be_valid
    end

  end
end
