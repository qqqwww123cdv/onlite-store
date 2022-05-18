require 'rails_helper'

RSpec.describe Category, type: :model do

  it 'has a name and description' do
    category = Category.new(
      name: 'tech',
      description: 'some text'
    )
    expect(category).to be_valid

    category.name = ''
    expect(category).to_not be_valid
  end

  it 'checks that a category can be updated' do
    category = Category.new(
      name: 'tech',
      description: 'some text'
    )
    category.update(:name => "good")
    expect(Category.find_by_name("good")).to eq(category)
  end

  it 'checks that a category can be destroyed' do
    category = Category.new(
      name: 'tech',
      description: 'some text'
    )
    category.destroy
    expect(Category.count).to eq(0)
  end
end