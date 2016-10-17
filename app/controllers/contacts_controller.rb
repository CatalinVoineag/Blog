class ContactsController < ApplicationController

	def index
	end

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(params.permit![:contact])
		@contact.request = request
		if @contact.deliver
			flash[:notice] = "Thank you for your message!"
			ContactMailer.sample_email.deliver
			redirect_to root_path
		else
			flash[:error] = AlertsHelper.getErrorAlertMessages(@contact)
			render :new
		end
	end



end
	