require "rails_helper"

feature "user visits homepage" do
	scenario "successfully" do
		visit root_path
		expect(page).to have_css 'p', text: 'welcome to the home page'
	end
end