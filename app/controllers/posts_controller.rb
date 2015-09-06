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
		
	end

	def index

	end

	def delete
		
	end

	##################
	def post_params
		params.require(:post).permit(:title, :body)
	end

	def logged_in_user
		@admin = Admin.find(params[:id])
		if @admin.id != current_user.id
			redirect_to :index
			flash[:error] = "you can't go here"
		end
	end
end
