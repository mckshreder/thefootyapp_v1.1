require 'rails_helper'
describe "the signin process", :type => :feature do
 

  let(:user) { FactoryGirl.create(:valid_user)}

  it "signs me in" do
    visit '/sessions/new'
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password
    click_button "Log In"
    expect(current_path).to eq(posts_path)
  end

  it "signs me in and out" do
    visit '/sessions/new'
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password
    click_button "Log In"
    expect(current_path).to eq(posts_path)
    find(".dropdown").click_link('Log out')
    expect(current_path).to eq(new_session_path)
  end


end