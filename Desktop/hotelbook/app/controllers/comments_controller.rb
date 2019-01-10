class CommentsController < ApplicationController
	# before_action :authenticate_user!
	before_action :find_comment, only: [:edit, :update, :destroy]
	respond_to :html, :json

	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.create(params[:comment].permit(:commentaire))
		@comment.user_id = current_user.id
		@comment.post_id = @post.id

		if @comment.save
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		@comment.update(comment_params)
		redirect_to @post
	end

	def destroy
		@comment.destroy
		redirect_to @post
	end

	private

	def find_comment
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
	end

	def comment_params
		params.require(:comment).permit(:commentaire)
	end

end
