require "rails_helper"

feature "admin makes a new post" do
	scenario "successfully" do
		sign_in("test","testword")
		create_post("cool post","This post is so cool oh jeez")
		
		expect(page).to have_css 'h3', text: "cool post" 
		expect(page).to have_css 'div', text: "This post is so cool oh jeez"  

	end
end