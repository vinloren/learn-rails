class UserMailer < ActionMailer::Base
	default from: ENV["OWNER_EMAIL"] #@contact.email
	def contact_email(contact)
		@contact = contact
		mail(to: ENV["OWNER_EMAIL"], from: ENV["OWNER_EMAIL"], :subject => "Website Contact")
	end
end
