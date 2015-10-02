module Features 
	def create_post(title, body)
		
		visit root_path
		click_on "make a new post"	
		fill_in "Title", with: title
		fill_in "Body", with: body
		click_on "submit"		
	end
end