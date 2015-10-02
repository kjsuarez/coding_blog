require "rails_helper"

feature "user signs in" do
	
	scenario "successfully" do
		sign_in("test","testword")
 		
 		expect(page).to have_css 'p', text: 'it worked!'
	end

	scenario "unsuccessfully" do
		incorrect_sign_in("test","testword", "Incorrect", "thisIsLongEnough")

 		expect(page).not_to have_css 'p', text: 'it worked!'	
 		expect(page).to have_css 'p', text: 'login' 	
	end

	scenario "with incorrect username" do
		incorrect_sign_in("test","testword", "Incorrect", "testword")

 		expect(page).not_to have_css 'p', text: 'it worked!'	
 		expect(page).to have_css 'p', text: 'login' 	
	end

	scenario "with incorrect password" do
		incorrect_sign_in("test","testword", "test", "thisIsLongEnough")

 		expect(page).not_to have_css 'p', text: 'it worked!'	
 		expect(page).to have_css 'p', text: 'login' 	
	end		
end

