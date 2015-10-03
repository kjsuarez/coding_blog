class StaticPagesController < ApplicationController
	def success_page		
	end

	def home	
		puts "current user: #{current_user}, logged in? #{logged_in?}"
	end

end
