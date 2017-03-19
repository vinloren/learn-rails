class ApplicationMailer < ActionMailer::Base
	default from: "do-not-reply@fakenews.com"
	layout "mailer"
end
