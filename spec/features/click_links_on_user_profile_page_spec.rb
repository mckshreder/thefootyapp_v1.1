require 'rails_helper'
describe "the user profile link features", :type => :feature do
 	let(:user) { FactoryGirl.create(:valid_user) }
  before :each do
    visit '/sessions/new'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button "Log In"
   end


    it "should allow you to link to user profile underneath Posted by: user who posted video" do

     	visit '/users/1'
     	find".video-container > a.title_link".click_link('user.name')
     	expect(current_path).to eq(user_profile_path(post.user))

    end

end