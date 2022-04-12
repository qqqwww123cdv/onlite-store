require 'rails_helper'

RSpec.describe "admin/products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      product_name: "Product Name",
      image: nil,
      vendor_code: "12345qw",
      price: "9.99",
      description: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Product Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/12345qw/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/MyText/)
  end
end
