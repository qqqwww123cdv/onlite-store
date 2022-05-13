require 'rails_helper'

RSpec.describe "admin/categories/edit", type: :view do
  before(:each) do

    @category = assign(:category, Category.create!(
      name: "text",
      description: "MyText"
    ))
  end

  it "renders the edit category form" do
    render

    assert_select "form[action=?][method=?]", admin_category_path(@category), "post" do

      assert_select "input[name=?]", "category[name]"

      assert_select "textarea[name=?]", "category[description]"
    end
  end
end
