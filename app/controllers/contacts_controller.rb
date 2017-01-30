class ContactsController < ApplicationController

	before_action :set_contact, only: [:show, :destroy]

	def index
		@contacts = Contact.all
	end

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			ContactMail.send_email.deliver
			flash[:notice] = "Thank you for your message."
			redirect_to root_path
		else
			flash[:error] = AlertsHelper.getErrorAlertMessages(@contact)
			redirect_to new_contact_path
		end
	end

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

	private 

		def set_contact
			@contact = Contact.find(params[:id])
		end

		def contact_params
			params.require(:contact).permit(:name, :email, :message)
		end



end
	