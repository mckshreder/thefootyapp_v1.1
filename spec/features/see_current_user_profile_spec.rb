require 'rails_helper'
describe "the user profile route functions", :type => :feature do
 	let(:user) { FactoryGirl.create(:valid_user) }
  before :each do
      visit '/sessions/new'
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password
    click_button "Log In"
     end

    it "should redirect to user profile when clicked" do
     visit '/posts'
     find(".nav").click_link("#{user.name.split.first}")
     expect(current_path).to eq(user_profile_path(user))
    end
end