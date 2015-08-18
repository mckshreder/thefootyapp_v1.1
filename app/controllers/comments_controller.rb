class CommentsController < ApplicationController
	def new
        @comment = Comment.new
    end

	def create
        comment = Comment.new(body: params[:comment][:body])
        post = Post.find(params[:post_id])
        if comment.valid? && post
            post.comments.push comment
            post.save
            current_user.comments.push comment
            current_user.save
            redirect_to post_path(id: post.id)
        else
            flash["alert-warning"] = "Sorry, comment not created"
            redirect_to post_path(id: post.id)
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        post_id = comment.post.id
        comment.destroy
        respond_to do |format|
        format.html { redirect_to post_path(id: post_id), notice: 'Comment was successfully destroyed.' }
        format.json { head :no_content }
        end
        
    end

end
