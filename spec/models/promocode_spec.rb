require 'rails_helper'

RSpec.describe Promocode, type: :model do

  it 'has a code at between 4 and 4 characters' do
    promocode = Promocode.new(
      code: '1212',
      discount: '10'
    )
    expect(promocode).to be_valid

    promocode.code = '12345'
    expect(promocode).to_not be_valid
  end

  it 'has a discount at between 1 and 100 characters' do
    promocode = Promocode.new(
      code: '1212',
      discount: '99'
    )
    expect(promocode).to be_valid

    promocode.discount = ''
    expect(promocode).to_not be_valid
  end

  it 'checks that a promocode can be updated' do
    promocode = Promocode.new(
      code: '1212',
      discount: '99'
    )
    promocode.update(:code => "1111")
    expect(Promocode.find_by_code("1111")).to eq(promocode)
  end

  it 'checks that a promocode can be destroyed' do
    promocode = Promocode.new(
      code: '1212',
      discount: '99'
    )
    promocode.destroy
    expect(Promocode.count).to eq(0)
  end

end