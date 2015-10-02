require "rails_helper"

feature "Admin edits post" do
	scenario "succesfully" do
		@user = sign_in("test","testword")
		
		visit posts_index_path
		create_post("new post","what a cool post")
		expect(page).to have_css 'h3', text: "new post" 
		expect(page).to have_css 'div', text: "what a cool post"
		click_on "edit post"
		expect(page).to have_css 'h3', text: "revise this post"	
		
		fill_in "Title", with: "new and improved title"
		fill_in "Body", with: "brand new body"
		click_on "update"			
		expect(page).to have_css 'h3', text: "new and improved title"	
		expect(page).to have_css 'div', text: "brand new body"	
	end
end