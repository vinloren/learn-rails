class UserMailer < ActionMailer::Base
	default from: 'no-reply@fakenews.con'
	def contact_email(contact)
		@contact = contact
	#	mail(to: ENV["OWNER_EMAIL"], from: @contact.email, :subject => "Website Contact")
	    mg_client = Mailgun::Client.new(ENV['API_KEY']) 
	    message_params = {  :from => @contact.email,
	    					:to =>  ENV['OWNER_EMAIL'],
	    					:subject => "Website Contact",
	    					:text => @contact.content
	    				 }
	    mg_client.send_message(ENV['DOMAIN'],message_params)
	end 
end
 