class ContactMailer < ActionMailer::Base

	default_url_options[:host] = 'localhost:3000'
	default from: "foobar@example.com"

	def sample_email(username, message)
		@user = username
		@message = message
		mail(to: 'catalin94v@gmail.com', subject:'working?')
	end



end
