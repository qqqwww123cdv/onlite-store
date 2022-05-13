require 'rails_helper'

RSpec.describe "admin/categories/show", type: :view do
  before(:each) do
    @category = assign(:category, Category.create!(
      name: "test",
      description: "MyText"
    ))
  end

  it "renders attributes" do
    render
    expect(rendered).to match(/test/)
    expect(rendered).to match(/MyText/)
  end
end
