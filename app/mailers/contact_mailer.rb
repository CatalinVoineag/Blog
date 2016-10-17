class ContactMailer < ApplicationMailer

	default from: "foobar@example.com"

	def sample_email
		@user = 'http://www.google.com'
		mail(to: 'catalin94v@gmail.com', subject:'working?')
	end

end
