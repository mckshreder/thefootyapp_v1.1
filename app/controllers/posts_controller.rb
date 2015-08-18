class PostsController < ApplicationController
 	 # before_action :authorize
 	def index
        @posts = Post.all.order('created_at DESC')
        @user = User.new
        
    end

    def new
    	@post = Post.new
        @event = Event.new
    end

    def show
        @posts = Post.all.shuffle
        @post = Post.find(params[:id])
        @comment = Comment.new
        @user = Post.find(params[:id])
    end

   def create
        @post = Post.new(post_params)
        # @events = Event.new(event_params)
        if params[:image_id].present?
          preloaded = Cloudinary::PreloadedFile.new(params[:image_id])         
          raise "Invalid upload signature" if !preloaded.valid?
          @event.image_id = preloaded.identifier
        end

        if params[:video_id].present?
          preloaded = Cloudinary::PreloadedFile.new(params[:video_id])         
          raise "Invalid upload signature" if !preloaded.valid?
          @event.video_id = preloaded.identifier
        end
        respond_to do |format|
            
        if current_user.posts.push @post
            
            format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
            format.json { render :show, status: :created, location: @post }

      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
end

            

def edit
    @post = Post.find(params[:id])
end

def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params.require(:post).permit(:title,:body,:youtube_url,:image, :address, :video))
        redirect_to posts_path
    else 
        render :edit
    end
end

def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'post was successfully destroyed.' }
      format.json { head :no_content }
    end
    
end


private
	def post_params
		params.require(:post).permit(:title,:body,:youtube_url, :image, :address, :video)
	end

    

end
