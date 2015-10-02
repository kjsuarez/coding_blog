require "rails_helper"

feature "admin makes a new post" do
	scenario "successfully" do
		sign_in("test","testword")
		
		visit root_path
		expect(page).to have_css 'a', text: "make a new post"
		click_on "make a new post"
		expect(page).to have_css 'h1', text: "write new post:" 
		
		fill_in "Title", with: "cool post"
		fill_in "Body", with: "This post is so cool oh jeez look at this cool post."
		click_on "submit"
		expect(page).to have_css 'h3', text: "cool post" 
		expect(page).to have_css 'div', text: "This post is so cool oh jeez look at this cool post."  

	end
end