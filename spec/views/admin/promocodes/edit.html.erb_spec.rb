require 'rails_helper'

RSpec.describe "admin/promocodes/edit", type: :view do
  before(:each) do
    @promocode = assign(:promocode, Promocode.create!(
      code: "9.99",
      discount: "11"
    ))
  end

  it "renders the edit promocode form" do
    render

    assert_select "form[action=?][method=?]", admin_promocode_path(@promocode), "post" do

      assert_select "input[name=?]", "promocode[code]"

      assert_select "input[name=?]", "promocode[discount]"

    end
  end
end
