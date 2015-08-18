require 'rails_helper'

RSpec.describe User, :type => :model do
  
  # before do
  #   @user = FactoryGirl.create(:user)
  # end

  
  context "email" do

		  it "must be present" do
		    expect(FactoryGirl.build(:null_email).save).to be false
		  end 

		  it "must be a unique email" do
		  	 FactoryGirl.create(:valid_user)
		  	expect(FactoryGirl.build(:valid_user).save).to be false
		  end

		  # it "must have proper format" do
		  # 	expect(FactoryGirl.build(:valid_user).save).to be false
		  # end

	end
  
  context "password" do 

		it "must be present" do
      		expect(FactoryGirl.build(:null_password).save).to be false
  		end 

  		it "must be atleast 6 characters" do
  			expect(FactoryGirl.build(:password_length).save).to be false
		end

		it "must be less than 10 characters" do 
			expect(expect(FactoryGirl.build(:long_password_length).save).to be false)
		end
end
end
