# Contact model
class Contact < ActiveRecord::Base 
 has_no_table
 #column :name, :string 
 #column :email, :string 
 #column :content, :string
 attr_accessor :name, :string
 attr_accessor :email, :string
 attr_accessor :content, :string
 validates_presence_of :name
 validates_presence_of :email
 validates_presence_of :content
 validates_format_of :email,
 :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
 validates_length_of :content, :maximum => 600
 
 def update_spreadsheet
    connection = GoogleDrive::Session.from_service_account_key(ENV['GOOGLE_CLIENT_SECRETS'],
    ["https://www.googleapis.com/auth/drive","https://spreadsheets.google.com/feeds/"])
	ss = connection.spreadsheet_by_title('Contact_List') # Learn-Rails-Example
	if ss.nil?
		ss = connection.create_spreadsheet('Contact_List')
	end
	ws = ss.worksheets[0]
	last_row = 1 + ws.num_rows
	puts "Numero righe = "+ ws.num_rows.to_s
	ws[last_row,1] = Time.new
	ws[last_row,2] = self.name
	ws[last_row,3] = self.email
	ws[last_row,4] = self.content
	ws.save
 end	
end
