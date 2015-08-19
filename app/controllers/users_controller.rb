  class UsersController < ApplicationController
  
    def index
        @users = User.all
    end
    
    def map 
        
        @users = User.all
        @user = User.new 
        @posts = Post.all.order('created_at DESC')
      #    if params[:query]
      #     search_field = params[:type].to_sym
      #     @posts = []
      #     @users.each do |user|
      #         if user[search_field].downcase.include? params[:query].downcase
      #             @posts << user.post
      #         end
      #       end
      #     # @posts = post.where(:name => params[:query])
      # else
      #   @posts = Post.all.order('created_at DESC')
      # end 
    end

    def new
        @user = User.new
    end
    
    def show
        @user = User.find(params[:id])
        @posts = @user.posts.order('created_at DESC')
        @comment = Comment.new
    end

    def create
        @user = User.new(user_params)

        if params[:image_id].present?
        preloaded = Cloudinary::PreloadedFile.new(params[:image_id])         
        raise "Invalid upload signature" if !preloaded.valid?
        @user.image_id = preloaded.identifier
        end

        respond_to do |format|
      if @user.save && @user.authenticate(user_params[:password])

        MyMailer.tester_email(@user).deliver_later
        
        session[:user_id] = @user.id
        flash["alert-success"] = "Hi #{current_user.name}! You are now logged in."
        format.html { redirect_to posts_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

        # if User.create(user_params).valid?
        #     flash["alert-success"] = "You have been registered"
        #     redirect_to users_path
        # else
        #     flash["alert-warning"] = "Unable to register you"
        #     redirect_to new_user_path
        # end
    end

    def edit 
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])

        if params[:image_id].present?
        preloaded = Cloudinary::PreloadedFile.new(params[:image_id])         
        raise "Invalid upload signature" if !preloaded.valid?
        @user.image_id = preloaded.identifier
        end

      respond_to do |format|
        if @user.update(user_params) 
          format.html { redirect_to user_profile_path(@user), notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }

        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
        # if @user.update_attributes(params.require(:user).permit(:name, :email, :password, :password_confirmation, :image))
        #     redirect_to posts_path
        # else 
        #     render :show
    # end
    # end

    def destroy
        @user.destroy
        respond_to do |format|
        format.html { redirect_to users_path, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
        end
        # @user = User.find(params[:id])
        # @user.destroy
        # redirect_to users_path
    end

private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :bio, :location, :image)
    end

end
