require 'rails_helper'

RSpec.describe Checkout, type: :model do

  subject(:checkout) { FactoryBot.create(:checkout) }

  
  it 'has a name' do
    expect(subject).to be_valid

    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'has a name at between 1 and 20 characters' do
    expect(subject).to be_valid

    subject.name = 'Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaanton'
    expect(subject).to_not be_valid
  end

  it 'has a address minimum 20 characters' do
    expect(subject).to be_valid

    subject.address = 'house 29'
    expect(subject).to_not be_valid
  end

  it 'has a email' do
    expect(subject).to be_valid

    subject.email = ''
    expect(subject).to_not be_valid
  end
end