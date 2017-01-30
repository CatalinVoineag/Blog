class ContactMail < ApplicationMailer

	default from: 'sngstacking@gmail.com'

	def send_email
		@greeting = "You've got mail!"

		mail to: 'catalin94v@gmail.com', subject: 'Subject'
	end

end
