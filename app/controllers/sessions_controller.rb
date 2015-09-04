class SessionsController < ApplicationController
  def new
  	# sign in form
  	#name, password, password_confirmation
  end

  def create
  	@user_name = params[:session][:name]
  	@user = User.find_by(name: @user_name)

  	if @user && @user.authenticate(params[:session][:password])
  		login(@user) 
  	else
  		
  	end

  end


end
