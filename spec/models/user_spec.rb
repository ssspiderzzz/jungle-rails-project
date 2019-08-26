require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes - first_name, last_name, email, password' do
      @user = User.new(first_name: 'Spider', last_name: 'Z', email: 'spider@gmail.com', password: '123', password_confirmation: '123')
      @user.save
      expect(@user).to be_valid
    end
    it 'is not valid different password and password_confirmation' do
      @user = User.new(first_name: 'Spider', last_name: 'Z', email: 'spider@gmail.com', password: '123', password_confirmation: '1234')
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      expect(@user).to_not be_valid
    end
    it 'is not valid without password_confirmation' do
      @user = User.new(first_name: 'Spider', last_name: 'Z', email: 'spider@gmail.com', password: '123')
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      expect(@user).to_not be_valid
    end
    it 'is not valid without first_name' do
      @user = User.new(last_name: 'Z', email: 'spider@gmail.com', password: '123', password_confirmation: '123')
      @user.save
      expect(@user.errors.full_messages).to include("First name can't be blank")
      expect(@user).to_not be_valid
    end
    it 'is not valid without last_name' do
      @user = User.new(first_name: 'Spider', email: 'spider@gmail.com', password: '123', password_confirmation: '123')
      @user.save
      expect(@user.errors.full_messages).to include("Last name can't be blank")
      expect(@user).to_not be_valid
    end
  end
end