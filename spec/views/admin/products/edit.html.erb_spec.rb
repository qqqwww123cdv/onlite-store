require 'rails_helper'

RSpec.describe "admin/products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      product_name: "MyString",
      image: nil,
      vendor_code: "1234367",
      price: "9.99",
      description: "MyText"
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", admin_product_path(@product), "post" do

      assert_select "input[name=?]", "product[product_name]"

      assert_select "input[name=?]", "product[image]"

      assert_select "textarea[name=?]", "product[vendor_code]"

      assert_select "input[name=?]", "product[price]"

      assert_select "textarea[name=?]", "product[description]"
    end
  end
end
