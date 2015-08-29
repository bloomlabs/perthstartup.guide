class UserMailer < ApplicationMailer
	def approve_email(company)
		@company = company
		mail(to: "brayden@bloom.org.au", subject: "Perthstartup.guide - Approve Company");
	end
end
