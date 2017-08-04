class CommentsController < ApplicationController
	before_action :find_commentable

	def new
		@comment = Comment.new
	end

	def create
		@comment = @commentable.comments.new comment_params
		if @comment.save
			redirect_back(fallback_location: root_path, notice: "comment created")
		else
			render :new
		end
	end

	def destroy
		@commentable.destroy
		redirect_back(fallback_location: root_path, notice: "Comment has been deleted!!")
	end


	private

	def comment_params
		params.require(:comment).permit(:body).merge(commenter_id: current_user.id)
	end

	def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Blog.find_by_id(params[:blog_id]) if params[:blog_id]
    end
end

