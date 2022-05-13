require 'rails_helper'

RSpec.describe "admin/categories/index", type: :view do
  
  let(:user) { FactoryBot.create(:user) }
  before(:each) do
    allow(view).to receive(:current_user).and_return(user)
    assign(:categories, [
      Category.create!(
        name: "text",
        description: "MyText"
      )
    ])
  end

  it "renders a list of categories" do
    render  
    expect(rendered).to include("text")
    expect(rendered).to include("MyText")
  end
end
