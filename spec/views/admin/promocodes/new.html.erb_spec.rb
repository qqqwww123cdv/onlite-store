require 'rails_helper'

RSpec.describe "admin/promocodes/new", type: :view do
  before(:each) do
    assign(:promocode, Promocode.new(
      code: "1111",
      discount: "11"
    ))
  end

  it "renders new promocode form" do
    render

    assert_select "form[action=?][method=?]", admin_promocodes_path, "post" do

      assert_select "input[name=?]", "promocode[code]"

      assert_select "input[name=?]", "promocode[discount]"
    end
  end
end
