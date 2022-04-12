require 'rails_helper'

RSpec.describe Product, type: :model do

  it 'has a name' do
    product = Product.new(
      product_name: '',
      vendor_code: '1111111',
      description: '1111111',
      price: '12',
    )
    expect(product).to_not be_valid

    product.product_name = 'Has a name'
    expect(product).to be_valid
  end

  it 'has a name at between 2 and 500 characters' do
    product = Product.new(
      product_name: 'q',
      vendor_code: '1111111',
      description: '1111111',
      price: '12',
    )
    expect(product).to_not be_valid

    long_string = 'XbuZL9PCJoutaezhOO8LtuTn4O1dMWJus4UBStgd6M6E9hg5EyAn2XVKHBsTOXurdRqr1sp9MUjtNNBxus7qCwopSRL68sIcGSx10GycuQRMArrV71wlKRO29QjPqj0A9Gicmidm9pZdPJpOUyLkXvNQAuK6APwy3H9BvTWC8rZltcvPTkPARHP1QmT1jGkw8UxNkFOKhtqTAY03e24wJszWzIM84ezk0zbzYIglAti4FDcMhuLTboLSWi54IOilShEIRvFcbC4mrSgv1ufEa1gEcS9IZJmmi6M9H4fsQOrZnEp16ryo4157W335pmABJeduJb3ohH7UA2c50Wg5J60oZG2g1ZMzBRpGFPxHbWr034xA0oAU6qfAbE9nnzv84KZmXH2aUpuLqYBqXHTrbUHk6bmMjKCM2nYm2vo4j1i38bdIqbvZLXdYOJ4qrpXq1mwP3qU7Bycr6E4M5wYibRRVTdNNE6a57306zswszYeWFgaZnxas'
    product.product_name = long_string
    expect(product).to be_valid
  end

  it 'has a code' do
    product = Product.new(
      product_name: 'anton',
      vendor_code: '',
      description: '1111111',
      price: '12',
    )
    expect(product).to_not be_valid

    product.vendor_code = '1234567'
    expect(product).to be_valid
  end

  it 'has a code at between 7 and 7 characters' do
    product = Product.new(
      product_name: 'anton',
      vendor_code: '123456',
      description: '1111111',
      price: '12',
    )
    expect(product).to_not be_valid

    product.vendor_code = '1234567'
    expect(product).to be_valid
  end

  it 'maximum description length' do
    product = Product.new(
      product_name: 'tv',
      vendor_code: '1111111',
      description: 'some text',
      price: '12',
    )
    expect(product).to be_valid

    description_string = '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'
  
    product.description = description_string
    expect(product).to_not be_valid
  end

  it 'has a price' do
    product = Product.new(
      product_name: 'anton',
      vendor_code: '1234567',
      description: 'some text',
      price: '',
    )
    expect(product).to_not be_valid

    product.price = '12'
    expect(product).to be_valid
  end

  it 'checks that a product can be updated' do
    product = Product.new(
      product_name: 'Tv',
      vendor_code: '1111111',
      description: '1111111',
      price: '12',
    )
    product.update(:product_name => "Big TV")
    expect(Product.find_by_product_name("Big TV")).to eq(product)
  end

  it 'checks that a product can be destroyed' do
    product = Product.new(
      product_name: 'Tv',
      vendor_code: '1111111',
      description: '1111111',
      price: '12',
    )
    product.destroy
    expect(Product.count).to eq(0)
  end

end