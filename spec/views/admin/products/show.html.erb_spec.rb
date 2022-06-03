require 'rails_helper'

RSpec.describe "admin/products/show", type: :view do
  before(:each) do
    @category = Category.create(:id => "1", :name=> "test", :description => "test2")

    @product = assign(:product, Product.create!(
      product_name: "Product Name",
      image: nil,
      vendor_code: "12345qw",
      price: "10",
      description: "MyText",
      category_id: "1"
    ))
  end

  it "renders attributes" do
    render
    expect(rendered).to match(/Product Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/12345qw/)
    expect(rendered).to match(/10/)
    expect(rendered).to match(/MyText/)
  end
end
