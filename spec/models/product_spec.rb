require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    before :each do
      @category = Category.new(name: 'test')
      # @product = @category.products.new()
    end

    it 'should be saved succesfully when all fields present' do
      product = @category.products.new(name: 'Field lamp', price: 40, quantity: 30)
      product.save!
      expect(Product.count).to be(1)
    end

    it 'should validate the presence of name' do
      product = @category.products.new(price: 40, quantity: 30)
      product.valid?
      expect(product.errors).to have_key(:name)
    end

    it 'should validate the presence of price' do
      product = @category.products.new(name: 'Mocha', quantity: 30)
      product.valid?
      expect(product.errors).to have_key(:price)
    end

    it 'should validate the presence of quantity' do
      product = @category.products.new(name: 'Some name', price: 40)
      product.valid?
      expect(product.errors).to have_key(:quantity)
    end

    it 'should validate the presence of category' do
      product = Product.new(price: 40, quantity: 30, name: 'Hey')
      product.valid?
      expect(product.errors).to have_key(:category)
    end

  end
end
