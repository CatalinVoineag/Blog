class ContactsController < ApplicationController

	def index
	end

	def new
		@contact = Contact.new
	end

	# def create
	# 	@contact = Contact.new(params.permit![:contact])
	# 	@contact.request = request
	# 	if @contact.deliver
	# 		contact = ContactMailer.sample_email
	# 		if contact.deliver
	# 			flash[:notice] = "Thank you for your message!"
	# 		else
	# 			flash[:error] = "Email not sent"
	# 		end
	# 		redirect_to root_path
	# 	else
	# 		flash[:error] = AlertsHelper.getErrorAlertMessages(@contact)
	# 		render :new
	# 	end
	# end

	def email
		username = params[:name] 
		message = params[:message]
		contact_mailer = ContactMailer.sample_email(username, message)
		if contact_mailer.deliver
			flash[:notice] = "Email sent"
		else
			flash[:error] = "Email not sent"
		end 
		redirect_to :back
	end


end
	