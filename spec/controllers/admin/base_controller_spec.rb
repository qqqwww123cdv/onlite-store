require "rails_helper"


RSpec.describe Admin::BaseController, :type => :controller do

  before do
    visit '/users/sign_up'
    fill_in 'Email', with: 'qw@mail.ru'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
  end

  describe "User verification" do
    it "Error message" do
      visit '/admin/products/new'
      expect(page).to have_content "Only available for admin!"
    end
  end

end