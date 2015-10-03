require "rails_helper"

feature "user views single post" do
	scenario "succesfully" do
		@user = sign_in("test","testword")
		create_post("new post","what a cool post")		
		visit posts_index_path

		 click_on "new post"
		 expect(page).to have_css "h3", text: "new post"  
	end
end