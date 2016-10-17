class Contact < MailForm::Base


	attr_accessor :nickname

	attribute :name, 	   validate: true
	attribute :email,    validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	attribute :message,  validate: true
	attribute :nickname, captcha:  true

	def headers 
		{
			subject: "Contact Form",
			to: "catalin94v@gmail.com",
			from: %("#{name}" <#{email}>)
		}
	end 

end