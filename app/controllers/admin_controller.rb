class AdminController < ApplicationController

	before_filter :set_layout
	before_filter :require_admin

	before_filter :set_message, only: [:show_message, :delete_message]

	def index
		
	end

	def posts
		@posts = Post.all
	end

	def messages
		@messages = Message.all.sort_by(&:created_at)
	end

	def show_message
		@message.update_attribute(:read, true)
	end

	def delete_message
		@message.destroy
		flash[:notice] = "Message Deleted"
		redirect_to admin_messages_path
	end

	private

		def set_message
			@message = Message.find(params[:id])
		end


end
