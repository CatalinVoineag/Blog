class StaticPagesController < ApplicationController

	def index
		@posts = Post.all.where(archived: false)
  end

end
