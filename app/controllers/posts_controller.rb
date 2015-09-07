class PostsController < ApplicationController
  
	before_action :logged_in_user, only: [:new, :edit]
  ################  standard actions
	def new
		@admin = Admin.find(params[:admin_id])
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.save
		redirect_to  '/posts/index'
		flash[:success] = "posted!"
	end

	def edit
		@admin = Admin.find(params[:admin_id])
		@post = Post.find(params[:id])
	end

	def update
		@admin = Admin.find(params[:admin_id])
		@post = Post.find(params[:id])
		@post.save
		redirect_to '/posts/index'
	end

	def index
		@posts = Post.all
	end

	def delete
		
	end

	##################
	def post_params
		params.require(:post).permit(:title, :body)
	end

	def logged_in_user
		logged_in?
	end
end
