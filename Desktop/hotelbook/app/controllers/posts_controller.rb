class PostsController < ApplicationController
	before_action :verif_user, only: [:edit, :update]
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:contact]

	def index
		 if params[:category].present?
		 	@category_id = Category.find_by(nom: params[:category]).id
			@posts = Post.where(category_id: @category_id).order("created_at DESC").page(params[:page]).per(6)
		elsif params[:search].present?
			@posts = Post.search(params)
		else
			@posts = Post.all.order("created_at DESC").page(params[:page]).per(6)
		end
		respond_to do |format|
	      format.html
	      format.json {render json: @posts.as_json(include: [:user])}
	    end
	end

	def show
		@comments = Comment.where(post_id: @post)
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

	def contact
	end

	def articles	
		@posts = Post.where(user_id: current_user.id).order("created_at DESC").page(params[:page]).per(6)	
	end

	private

	def find_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:titre, :description, :category_id)
	end

	def verif_user
      @post = Post.find(params[:id])
      if  @post.user == current_user
      else
        flash[:danger] = "Vous n\'avez pas le droit de modifier cet enregistrement."
        redirect_to root_path
        
      end
    end
end

