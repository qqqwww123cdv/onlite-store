require 'rails_helper'

RSpec.describe "admin/promocodes/index", type: :view do
  
  let(:user) { FactoryBot.create(:user) }
 
  before(:each) do
    allow(view).to receive(:current_user).and_return(user)
    assign(:promocodes, [
      Promocode.create!(
        code: '1111',
        discount: '10'
      ),
      Promocode.create!(
        code: '2222',
        discount: '20'
      )
    ])
  end


  it "renders a list of promocodes" do
    render
  
    expect(rendered).to include("1111")
    expect(rendered).to include("10")

    expect(rendered).to include("2222")
    expect(rendered).to include("20")
  end
end
