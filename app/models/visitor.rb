# Visitor model
class Visitor < ActiveRecord::Base
has_no_table
attr_accessor :email, :string
validates_presence_of :email
validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i

 def subscribe
	mailchimp = Gibbon::Request.new
	list_id = ENV['MAILCHIMP_LIST_ID']
	
	result = mailchimp.lists(list_id).members.create(body: 
	{
	 email_address: self.email, 
	 status: "pending"
	})

	if result
		Rails.logger.info("Subscribed #{self.email} to MailChimp")
		puts "Subscribed #{self.email} to MailChimp"
	end
 end
end
 
