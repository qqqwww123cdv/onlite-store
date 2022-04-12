require 'rails_helper'

RSpec.describe "admin/products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      product_name: "MyString",
      image: nil,
      vendor_code: "MyTextt",
      price: "9.99",
      description: "MyText"
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", admin_products_path, "post" do

      assert_select "input[name=?]", "product[product_name]"

      assert_select "input[name=?]", "product[image]"

      assert_select "textarea[name=?]", "product[vendor_code]"

      assert_select "input[name=?]", "product[price]"

      assert_select "textarea[name=?]", "product[description]"
    end
  end
end
