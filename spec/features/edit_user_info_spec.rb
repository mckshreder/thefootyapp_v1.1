require 'rails_helper'
describe "the user accout edit process", :type => :feature do
 	let(:user) { FactoryGirl.create(:valid_user) }
  before :each do
      visit '/sessions/new'
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password
    click_button "Log In"
     end

  
  it "brings user to edit profile page" do
  	visit '/posts'
  	find(".dropdown").click_link('Edit Account')
    expect(current_path).to eq(edit_users_path(user))
  end

   it "edits user then brings back to posts page" do
	  	visit '/posts'
	  	find(".dropdown").click_link('Edit Account')
	    expect(current_path).to eq(edit_users_path(user))
	    fill_in 'Name', :with => user.name
	    fill_in 'Email', :with => user.email
	    fill_in 'New Password', :with => user.password
	    fill_in 'Confirm New Password', :with => user.password
	    click_button "Update Info"
	    expect(current_path).to eq(users_path)
   end
end