require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before do
      @cat1 = Category.find_or_create_by! name: 'test_books'
      @product1 = @cat1.products.create!({
        name:  'Hamlet',
        # description: Faker::Hipster.paragraph(4),
        # image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      })
    end

    # validation tests/examples here
    it 'id should exist for new product' do
      expect(@product1.id).to be_present
    end

    it 'category should exist for new product' do
      expect(@product1.category).to be_present
    end

    it 'name should exist for new product' do
      expect(@product1.name).to be_present
    end

    it 'price should exist for new product' do
      expect(@product1.price).to be_present
    end

    it 'quantity should exist for new product' do
      expect(@product1.quantity).to be_present
    end

    it '.name cannot be blank' do
      cat2= Category.new
      cat2.name = 'test_cars'
      cat2.save
      product2 = Product.new
      product2.category = cat2
      product2.name = nil
      product2.price = 64.99
      product2.quantity = 15
      product2.save
      expect(product2.errors.messages[:name]).to eq ['can\'t be blank']
    end

    it '.category cannot be blank' do
      cat2 = Category.new
      cat2.name = 'test_cars'
      cat2.save
      product2 = Product.new
      product2.category = nil
      product2.name = "Test Car2"
      product2.price = 64.99
      product2.quantity = 15
      product2.save
      expect(product2.errors.messages[:category]).to eq ['can\'t be blank']
    end

    it '.price cannot be blank' do
      cat2 = Category.new
      cat2.name = 'test_cars'
      cat2.save
      product2 = Product.new
      product2.category = cat2
      product2.name = "Test Car2"
      product2.price = nil
      product2.quantity = 15
      product2.save
      expect(product2.errors.messages[:price]).to include 'can\'t be blank'
    end

    it '.quantity cannot be blank' do
      cat2 = Category.new
      cat2.name = 'test_cars'
      cat2.save
      product2 = Product.new
      product2.category = cat2
      product2.name = "Test Car2"
      product2.price = 64.99
      product2.quantity = nil
      product2.save
      expect(product2.errors.messages[:quantity]).to include 'can\'t be blank'
    end

  end
end
