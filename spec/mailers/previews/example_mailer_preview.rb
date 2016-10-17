# Preview all email at localhost:3000/rails/mailers/example_mailer

class ExampleMailerPreview < ActionMailer::Preview

	def sample_mail_preview
		ContactMailer.sample_email
	end

end