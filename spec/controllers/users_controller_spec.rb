require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

	it "should return index view for index" do

	get :index

	#staus code returned should be 200 for success
    expect(response).to have_http_status(:success)

	expect(response).to render_template(:index)	
	end

	it "should return new view for new" do

	get :new

	expect(response).to render_template(:new)	
	end


	it "new creates a new user" do
    get :new

    expect(assigns(:user)).to be_a_new(User)
  	end


  	it "allows creation of valid user" do
	
	post :create,{user: {name: "Michael Hartl", email: "mhartl@example.com", password: "dadddy", password_confirmation: "dadddy"}}
  
  	expect(response).to redirect_to(posts_path) 
  	end

  	
  	it "doesnt allow creation of invalid user" do
	
	post :create,{user: {name: "Michael Hartl", email: "mhartlexample.com", password: "dady", password_confirmation: "dadddy"}}
  
  	expect(response).to have_http_status(200)
  	end

end
