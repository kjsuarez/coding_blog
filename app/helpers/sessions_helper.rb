module SessionsHelper
	def current_user
		#@current_user = @current_user || User.find_by(id: user_id)
		@current_user ||= Admin.find_by(id: session[:admin_id])
	end

	def log_in(admin)
		session[:admin_id] =  admin.id
	end

	def logged_in?
		!current_user.nil?
 	end

	def log_out
		session[:admin_id] = nil
		@current_user = nil
	end
end
