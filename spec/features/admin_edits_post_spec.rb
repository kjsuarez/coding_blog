require "rails_helper"

feature "User edits post" do
	scenario "succesfully" do
		@user = sign_in("test","testword")
		create_post("new post","what a cool post")		
		visit posts_index_path

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

	scenario "unsuccesfully" do
		@user = sign_in("test","testword")
		create_post("new post","what a cool post")		
		sign_out
		expect(page).not_to  have_css 'a', text: "make a new post"	
		visit edit_admin_post_path(admin_id: 1, id: 1)
		expect(page).not_to have_css 'h3', text: "revise this post"
		expect(page).to have_css 'div', text: "you don't belong there"  
	end
end





