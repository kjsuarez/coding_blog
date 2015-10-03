class PostsController < ApplicationController
  
	before_action :logged_in_user, only: [:new, :edit]
  ################  standard actions
	def new
		@admin = Admin.find(params[:admin_id])
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.admin_id = params[:admin_id]
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
		@post.update_attributes(post_params)
		@post.save
		redirect_to '/posts/index'
	end

	def index
		@posts = Post.all
	end

	def show
		@admin = Admin.find(params[:admin_id])
		@post = Post.find(params[:id])
	end

	def delete
		
	end

	##################
	def post_params
		params.require(:post).permit(:title, :body)
	end

	def logged_in_user
		unless logged_in?
			flash[:danger] = "you don't belong there"
			redirect_to root_path
		end

	end
end
