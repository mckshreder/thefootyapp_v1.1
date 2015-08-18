class MyMailer < ApplicationMailer
	default from: "dadmusiq@gmail.com"
	def tester_email(user)
		@user = user
		mail(to: @user.email, subject: 'Welcome to the Footy™ app!')
	end
end
