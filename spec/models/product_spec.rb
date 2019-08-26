require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes - name, price, quantity, category' do
      @category = Category.new(name: 'PC Games')
      @category.save!
      @product = @category.products.create!(name: 'FF8 Remaster', price: 1999, quantity: 124, category: @category)
      @product.save
      expect(@product).to be_valid
    end
    it 'is not valid without category name' do
      @category = Category.new()
      @category.save
      expect(@category).to_not be_valid
    end
    it 'is not valid without name' do
      @category = Category.new(name: 'PC Games')
      @category.save!
      @product = @category.products.create(price: 1999, quantity: 124, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
      expect(@product).to_not be_valid
    end
    it 'is not valid without price' do
      @category = Category.new(name: 'PC Games')
      @category.save!
      @product = @category.products.create(name: 'FF8 Remaster', quantity: 124, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
      expect(@product).to_not be_valid
    end
    it 'is not valid without quantity' do
      @category = Category.new(name: 'PC Games')
      @category.save!
      @product = @category.products.create(name: 'FF8 Remaster', price: 1999, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
      expect(@product).to_not be_valid
    end
    it 'is not valid without specifying category' do
      @product = Product.new(name: 'FF8 Remaster', price: 1999, quantity: 124)
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
      expect(@product).to_not be_valid
    end
  end
end