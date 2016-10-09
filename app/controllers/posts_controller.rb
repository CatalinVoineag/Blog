class PostsController < ApplicationController

	before_action :set_post, except: [ :new, :index, :create ] 
	before_action :require_admin, except: [ :index, :show ]

	def index
		@posts = Post.all.where(archived: false)
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:notice] = "Post Created"
			redirect_to admin_post_show_path(@post)
		else
			flash[:error] = AlertsHelper.getErrorAlertMessages(@order)
			render admin_post_new_path
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
			render admin_post_edit_path(@post)
		end
	end

	private

		def post_params
			params.require(:post).permit(:user_id, :content, :title, :archived)
		end

		# Before filters

		def set_post
			@post = Post.find(params[:id])
		end

		def require_admin
			if params[:admin_scope].present? && params[:admin_scope] == true
				return true
			else
				redirect_to root_path
				flash[:warning] = "You are not allowed to perform that action"
				return false
			end
		end

end
