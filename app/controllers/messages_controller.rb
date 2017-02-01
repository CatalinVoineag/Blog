class MessagesController < ApplicationController

	#before_action :set_message, only: [ :edit, :update, :destroy]

	def new
		@message = Message.new
	end

	def create
		@message = Message.new(message_params)
		if @message.save
			#ContactMail.send_email.deliver
			flash[:notice] = "Thank you for your message."
			redirect_to root_path
		else
			flash[:error] = AlertsHelper.getErrorAlertMessages(@message)
			redirect_to new_message_path
		end
	end

	private

		# def set_message
		# 	@message = Message.find(params[:id])
		# end

		def message_params
			params.require(:message).permit(:name, :email, :message)
		end

end
