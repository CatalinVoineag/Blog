class PostsController < ApplicationController

	before_action :set_post, except: [ :new, :index, :create ] 

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:notice] = "Post Created"
			redirect_to @post
		else
			flash[:error] = AlertsHelper.getErrorAlertMessages(@order)
			render :new 
		end
	end

	def show
		@post
	end

	def edit
		@post
	end

	def update
		if @post.update_attributes(post_params)
			flash[:notice] = "Post Updated"
			redirect_to @post
		else
			flash[:error] = AlertsHelper.getErrorAlertMessages(@order)
			render :edit
		end
	end

	def destroy
		@post.destroy
		flash[:notice] = "Post Deleted"
	end

	private

		def post_params
			params.require(:post).permit(:user_id, :content, :title)
		end

		# Before filters

		def set_post
			@post = Post.find(params[:id])
		end

end
