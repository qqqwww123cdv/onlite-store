require 'rails_helper'

RSpec.describe "admin/products/index", type: :view do
  
  let(:user) { FactoryBot.create(:user) }
 
  before(:each) do
    allow(view).to receive(:current_user).and_return(user)
    assign(:products, [
      Product.create!(
        product_name: "Product Name",
        vendor_code: "1234567",
        price: "12",
        description: "MyText"
      ),
      Product.create!(
        product_name: "Name",
        vendor_code: "MyTextt",
        price: "122",
        description: "Text"
      )
    ])
  end


  it "renders a list of products" do
    allow(view).to receive_messages(:will_paginate => nil)
    render
  
    expect(rendered).to include("Product Name")
    expect(rendered).to include("1234567")
    expect(rendered).to include("12")
    expect(rendered).to include("MyText")

    expect(rendered).to include("Name")
    expect(rendered).to include("MyTextt")
    expect(rendered).to include("122")
    expect(rendered).to include("Text")
  end
end
