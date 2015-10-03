module Features 
	
	def sign_in(name, password)
		admin = Admin.create!(name: name, password: password)
		visit login_path
		expect(page).to have_css 'p', text: 'login'
		fill_in "Name", with: name
		fill_in "Password", with: password
		click_on "Log in"
		return admin
	end	
	def incorrect_sign_in(name, password, real_name, real_password)
		admin = Admin.create!(name: real_name, password: real_password)
		visit login_path
		expect(page).to have_css 'p', text: 'login'
		fill_in "Name", with: name
		fill_in "Password", with: password
		click_on "Log in"		
	end

	def sign_out
		click_on "log out"
		expect(page).to have_css 'div', text: "you've been logged out"  
	end
end
