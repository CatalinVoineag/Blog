require 'rails_helper'

feature 'login and create blog post' do 
	
	before do 
		FactoryGirl.create(:user)
	end

	scenario 'login and create post' do 
		visit('/admin')
		fill_in 'Email', with: 'catalin94v@gmail.com'
		fill_in 'Password', with: 'foobar'
		click_on 'Sign in'

		expect(page).to have_selector 'h1', text: 'Index'

		click_on 'Posts'
		click_on 'New Post'
		fill_in('Title', with: 'Content Title')
		fill_in('Content', with: "Content Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")

		#expect(page).to have_selector 'div', text: 'Post Created'
		page.should have_content 'Post Created'

		click_on 'Logo'
		expect(page).to have_current_path(root_path)

		
	end
end