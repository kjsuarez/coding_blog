class SessionsController < ApplicationController
  def new
  	# sign in form
  	#name, password, password_confirmation
  end

  def create
  	@admin_name = params[:session][:name]
  	@admin = Admin.find_by(name: @admin_name)

  	if @admin && @admin.authenticate(params[:session][:password])
  		puts "got this far"
  		log_in(@admin) 
  		redirect_to "/success"
  	else
  		flash.now[:error] = "nope it did'nt work"
  		render 'new'
  	end

  end


end
