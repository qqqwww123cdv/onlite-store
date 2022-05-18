require 'rails_helper'

RSpec.describe "admin/promocodes/show", type: :view do
  before(:each) do
    @promocode = assign(:promocode, Promocode.create!(
      code: "1111",
      discount: "11"
    ))
  end

  it "renders attributes" do
    render
    expect(rendered).to match(/1111/)
    expect(rendered).to match(/11/)
  end
end
