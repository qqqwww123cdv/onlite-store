require 'rails_helper'

RSpec.describe Checkout, type: :model do

  it 'has a name' do
    checkout = Checkout.new(
      name: 'Anton',
      address: 'Smorgovski streat house 29 apartment 68',
      email: 'test@mail.ru',
      user_id: '1'
    )
    expect(checkout).to be_valid

    checkout.name = ''
    expect(checkout).to_not be_valid
  end

  it 'has a name at between 1 and 20 characters' do
    checkout = Checkout.new(
      name: 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq',
      address: 'Smorgovski streat house 29 apartment 68',
      email: 'test@mail.ru',
      user_id: '1'
    )
    expect(checkout).to_not be_valid

    checkout.name = 'Anton'
    expect(checkout).to be_valid
  end

  it 'has a address minimum 20 characters' do
    checkout = Checkout.new(
      name: 'Anton',
      address: 'Smorgovski streat house 29 apartment 68',
      email: 'test@mail.ru',
      user_id: '1'
    )
    expect(checkout).to be_valid

    checkout.address = 'house 29'
    expect(checkout).to_not be_valid
  end

  it 'has a email' do
    checkout = Checkout.new(
      name: 'Anton',
      address: 'Smorgovski streat house 29 apartment 68',
      email: 'test@mail.ru',
      user_id: '1'
    )
    expect(checkout).to be_valid

    checkout.email = ''
    expect(checkout).to_not be_valid
  end

  it 'has a valid email' do
    checkout = Checkout.new(
      name: 'Anton',
      address: 'Smorgovski streat house 29 apartment 68',
      email: 'test@mail.ru',
      user_id: '1'
    )
    expect(checkout).to be_valid

    checkout.email = 'test@.ru'
    expect(checkout).to_not be_valid
  end


end