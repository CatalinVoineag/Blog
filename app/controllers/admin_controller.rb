class AdminController < ApplicationController

	before_filter :set_layout
	before_filter :require_admin

	def index
		
	end

	def posts
		@posts = Post.all
	end


end
